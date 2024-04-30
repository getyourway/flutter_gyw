import "dart:convert";
import "dart:math";
import "dart:typed_data";

import "package:flutter/material.dart";
import "package:flutter_gyw/src/helpers.dart";

import "commands.dart";
import "fonts.dart";
import "icons.dart";
import "screen.dart";

/// A drawing that can be displayed on a pair of aRdent smart glasses
@immutable
abstract class GYWDrawing {
  /// The distance (in pixels) from the top of the screen
  final int top;

  /// The distance (in pixels) from the left side of the screen
  final int left;

  /// Abstract const contructor.
  const GYWDrawing({
    this.top = 0,
    this.left = 0,
  });

  /// Converts the drawing into a list of commands understood by the device
  List<GYWBtCommand> toCommands();

  /// Deserializes a [GYWDrawing] from JSON data
  factory GYWDrawing.fromJson(Map<String, dynamic> data) {
    switch (data["type"]) {
      case TextDrawing.type:
        return TextDrawing.fromJson(data);
      case IconDrawing.type:
        return IconDrawing.fromJson(data);
      case RectangleDrawing.type:
        return RectangleDrawing.fromJson(data);
      case SpinnerDrawing.type:
        return SpinnerDrawing.fromJson(data);
      default:
        throw UnsupportedError("Type '${data['type']}' is not supported.");
    }
  }

  /// Serializes a drawing to JSON data
  Map<String, dynamic> toJson();
}

/// A drawing to display text on an aRdent device
@immutable
class TextDrawing extends GYWDrawing {
  /// The type of the [TextDrawing] drawing
  static const String type = "text";

  /// The text that must be displayed
  final String text;

  /// Returns the text wrapped on multiple lines constrained by [maxWidth] and [maxLines].
  String get wrappedText => _wrapText().join("\n");

  /// The [GYWFont] to use
  ///
  /// If no font is given, it uses the most recent one
  final GYWFont? font;

  /// The text size. Overrides the font size.
  final int? size;

  /// The color of the text.
  final Color color;

  /// The maximum width (in pixels) of the text.
  ///
  /// It will be wrapped on multiple lines if it is too long.
  final int? maxWidth;

  /// The maximum number of lines the text can be wrapped on.
  ///
  /// All extra lines will be ignored.
  /// The value 0 is special and disables the limit.
  final int maxLines;

  /// Creates a text element.
  const TextDrawing({
    required this.text,
    this.font,
    this.size,
    this.color = Colors.black,
    this.maxWidth,
    this.maxLines = 1,
    super.left = 0,
    super.top = 0,
  });

  @override
  List<GYWBtCommand> toCommands() {
    final int fontSize = size ?? font?.size ?? GYWFonts.small.font.size;
    final int charHeight = (fontSize * 1.33).ceil();

    final List<GYWBtCommand> commands = [];

    int currentTop = top;
    for (final String line in _wrapText()) {
      commands.addAll(_lineToCommands(line, currentTop));
      currentTop += charHeight;
    }
    return commands;
  }

  Iterable<String> _wrapText() sync* {
    // An invalid value will be considered as unconstrained.
    final int? maxWidth =
        this.maxWidth != null && this.maxWidth! < 1 ? null : this.maxWidth;

    final int maxLines = max(0, this.maxLines);

    int textWidth;
    final int availableWidth = GYWScreenParameters.width - left;
    if (maxWidth == null || maxWidth >= availableWidth) {
      // Never let the text overflow the screen on width.
      textWidth = availableWidth;
    } else {
      textWidth = maxWidth;
    }

    final int fontSize = size ?? font?.size ?? GYWFonts.small.font.size;
    final int charWidth = (fontSize * 0.6).ceil();
    final int maxCharsPerLine = textWidth ~/ charWidth;

    final List<String> words = text.split(" ");
    int lines = 0;
    final line = StringBuffer();

    for (final String word in words) {
      if (line.isNotEmpty && line.length + 1 + word.length > maxCharsPerLine) {
        yield line.toString();
        lines++;
        if (maxLines != 0 && lines >= maxLines) {
          return;
        }
        line.clear();
        line.write(word);
      } else {
        line.write(line.isEmpty ? word : " $word");
      }
    }
    yield line.toString();
  }

  List<GYWBtCommand> _lineToCommands(String line, int top) {
    // Bytes generation for the control data (command code + params)
    final controlBytes = BytesBuilder();

    controlBytes.add(int8Bytes(GYWControlCode.displayText.value));
    controlBytes.add(int16Bytes(left));
    controlBytes.add(int16Bytes(top));

    controlBytes.add(utf8.encode(font?.prefix ?? "NUL"));
    controlBytes.add(int8Bytes(size ?? 0));

    controlBytes.add(rgba8888BytesFromColor(color));

    return [
      GYWBtCommand(
        GYWCharacteristic.nameDisplay,
        const Utf8Encoder().convert(line),
      ),
      GYWBtCommand(
        GYWCharacteristic.ctrlDisplay,
        controlBytes.toBytes(),
      ),
    ];
  }

  @override
  String toString() {
    return "Drawing: Text '$text' with $font at ($left, $top)";
  }

  @override
  bool operator ==(Object other) {
    if (other is TextDrawing) {
      return text == other.text &&
          left == other.left &&
          top == other.top &&
          font == other.font &&
          size == other.size &&
          color.value == other.color.value &&
          maxWidth == other.maxWidth &&
          maxLines == other.maxLines;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => Object.hash(
        text,
        font,
        left,
        top,
        size,
        color,
        maxWidth,
        maxLines,
      );

  /// Deserializes a [TextDrawing] from JSON data
  factory TextDrawing.fromJson(Map<String, dynamic> data) {
    GYWFont? font;
    try {
      font = GYWFonts.values
          .firstWhere(
            (e) => e.font.prefix == data["font"],
          )
          .font;
    } on StateError {
      font = null;
    }

    return TextDrawing(
      left: data["left"] as int,
      top: data["top"] as int,
      // Deprecated: "text" key will be deprecated in future version
      text: data["data"] as String? ?? data["text"] as String,
      font: font,
      size: data["size"] as int?,
      color: colorFromHex(data["color"] as String?) ?? Colors.black,
      maxWidth: data["max_width"] as int?,
      maxLines: data["max_lines"] as int? ?? 1,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "left": left,
      "top": top,
      "data": text,
      // Deprecated: "text" key will be deprecated in future version
      "text": text,
      if (font != null) "font": font!.prefix,
      "size": size,
      "color": hexFromColor(color),
      "max_width": maxWidth,
      "max_lines": maxLines,
    };
  }
}

/// A drawing to display an icon on an aRdent device
@immutable
class IconDrawing extends GYWDrawing {
  /// The type of the [IconDrawing]
  static const String type = "icon";

  /// The displayed [GYWIcon]
  final GYWIcon icon;

  /// Hexadecimal code of the icon fill color
  final Color color;

  /// The icon scaling factor.
  ///
  /// Minimum is 0.01, maximum is 13.7.
  final double scale;

  /// Creates an icon element.
  const IconDrawing(
    this.icon, {
    super.top,
    super.left,
    this.color = Colors.black,
    this.scale = 1.0,
  });

  @override
  List<GYWBtCommand> toCommands() {
    final controlBytes = BytesBuilder();
    controlBytes.add(int8Bytes(GYWControlCode.displayImage.value));
    controlBytes.add(int16Bytes(left));
    controlBytes.add(int16Bytes(top));
    controlBytes.add(rgba8888BytesFromColor(color));
    controlBytes.add(byteFromScale(scale));

    return <GYWBtCommand>[
      GYWBtCommand(
        GYWCharacteristic.nameDisplay,
        const Utf8Encoder().convert("${icon.filename}.svg"),
      ),
      GYWBtCommand(
        GYWCharacteristic.ctrlDisplay,
        controlBytes.toBytes(),
      ),
    ];
  }

  @override
  String toString() {
    return "Drawing: ${icon.name} at ($left, $top)";
  }

  @override
  bool operator ==(Object other) {
    if (other is IconDrawing) {
      return icon == other.icon &&
          color.value == other.color.value &&
          left == other.left &&
          top == other.top &&
          scale == other.scale;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => Object.hash(
        icon,
        left,
        top,
        color,
        scale,
      );

  /// Deserializes an [IconDrawing] from JSON data
  factory IconDrawing.fromJson(Map<String, dynamic> data) {
    final String icon = data["data"] as String;

    final GYWIcon? gywIcon = GYWIcons.values
        .cast<GYWIcons?>()
        .firstWhere(
          (element) => element!.icon.filename == icon,
          orElse: () => null,
        )
        ?.icon;

    if (gywIcon != null) {
      return IconDrawing(
        gywIcon,
        left: data["left"] as int,
        top: data["top"] as int,
        color: colorFromHex(data["color"] as String?) ?? Colors.black,
        scale: (data["scale"] as num? ?? 1.0).toDouble(),
      );
    } else {
      return IconDrawing(
        GYWIcon(name: icon, filename: icon),
        left: data["left"] as int,
        top: data["top"] as int,
        color: colorFromHex(data["color"] as String?) ?? Colors.black,
        scale: (data["scale"] as num? ?? 1.0).toDouble(),
      );
    }
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "left": left,
      "top": top,
      "data": icon.filename,
      "color": hexFromColor(color),
      "scale": scale,
    };
  }
}

/// A drawing to display a rectangle on an aRdent device
@immutable
class RectangleDrawing extends GYWDrawing {
  /// The type of the [RectangleDrawing].
  static const String type = "rectangle";

  /// The rectangle width.
  final int width;

  /// The rectangle height.
  final int height;

  /// The fill color. If null, the rectangle will use the current background color.
  final Color? color;

  /// Creates a rectangle element.
  const RectangleDrawing({
    super.left,
    super.top,
    required this.width,
    required this.height,
    this.color,
  });

  @override
  List<GYWBtCommand> toCommands() {
    final controlBytes = BytesBuilder()
      ..add(int8Bytes(GYWControlCode.drawRectangle.value))
      ..add(int16Bytes(left))
      ..add(int16Bytes(top))
      ..add(uint16Bytes(width))
      ..add(uint16Bytes(height))
      ..add(rgba8888BytesFromColor(color));

    return [
      GYWBtCommand(
        GYWCharacteristic.ctrlDisplay,
        controlBytes.toBytes(),
      ),
    ];
  }

  @override
  String toString() {
    return "RectangleDrawing{left: $left, top: $top, width: $width, height: $height, color: $color}";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RectangleDrawing &&
          runtimeType == other.runtimeType &&
          left == other.left &&
          top == other.top &&
          width == other.width &&
          height == other.height &&
          color?.value == other.color?.value;

  @override
  int get hashCode => Object.hash(
        left,
        top,
        width,
        height,
        color,
      );

  /// Deserializes a [RectangleDrawing] from JSON data
  factory RectangleDrawing.fromJson(Map<String, dynamic> data) {
    return RectangleDrawing(
      left: data["left"] as int,
      top: data["top"] as int,
      width: data["width"] as int,
      height: data["height"] as int,
      color: colorFromHex(data["color"] as String?),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "left": left,
      "top": top,
      "width": width,
      "height": height,
      "color": color != null ? hexFromColor(color!) : null,
    };
  }
}

/// A drawing to display a spinner on an aRdent device
@immutable
class SpinnerDrawing extends GYWDrawing {
  /// The type of the [SpinnerDrawing].
  static const String type = "spinner";

  /// The scale of the image.
  final double scale;

  /// The fill color. If null, the image colors will be preserved.
  final Color? color;

  /// The curve applied while spinning.
  final AnimationTimingFunction animationTimingFunction;

  /// How many rotations per second.
  final double spinsPerSecond;

  /// Creates a spinner element.
  const SpinnerDrawing({
    super.left,
    super.top,
    this.scale = 1.0,
    this.color,
    this.animationTimingFunction = AnimationTimingFunction.linear,
    this.spinsPerSecond = 1.0,
  });

  @override
  List<GYWBtCommand> toCommands() {
    final controlBytes = BytesBuilder()
      ..add(int8Bytes(GYWControlCode.displaySpinner.value))
      ..add(int16Bytes(left))
      ..add(int16Bytes(top))
      ..add(rgba8888BytesFromColor(color))
      ..add(byteFromScale(scale))
      ..add(uint8Bytes(animationTimingFunction.id))
      ..add(uint8Bytes((spinsPerSecond.clamp(0.0, 25.5) * 10.0).toInt()));

    return [
      GYWBtCommand(
        GYWCharacteristic.nameDisplay,
        const Utf8Encoder().convert("spinner_1.svg"),
      ),
      GYWBtCommand(
        GYWCharacteristic.ctrlDisplay,
        controlBytes.toBytes(),
      ),
    ];
  }

  @override
  String toString() {
    return """
SpinnerDrawing{
  left: $left,
  top: $top,
  color: $color,
  scale: $scale,
  animationTimingFunction: $animationTimingFunction,
  spinsPerSecond: $spinsPerSecond,
}""";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpinnerDrawing &&
          runtimeType == other.runtimeType &&
          left == other.left &&
          top == other.top &&
          scale == other.scale &&
          color?.value == other.color?.value &&
          animationTimingFunction == other.animationTimingFunction &&
          spinsPerSecond == other.spinsPerSecond;

  @override
  int get hashCode => Object.hash(
        left,
        top,
        scale,
        color,
        animationTimingFunction,
        spinsPerSecond,
      );

  /// Deserializes a [RectangleDrawing] from JSON data
  factory SpinnerDrawing.fromJson(Map<String, dynamic> data) {
    return SpinnerDrawing(
      left: data["left"] as int,
      top: data["top"] as int,
      scale: (data["scale"] as num).toDouble(),
      color: colorFromHex(data["color"] as String?),
      animationTimingFunction: AnimationTimingFunction.values.byName(
        data["animation_timing_function"] as String,
      ),
      spinsPerSecond: (data["spins_per_second"] as num).toDouble(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "left": left,
      "top": top,
      "scale": scale,
      "color": color != null ? hexFromColor(color!) : null,
      "animation_timing_function": animationTimingFunction.name,
      "spins_per_second": spinsPerSecond,
    };
  }
}

/// The animations for spinner rotating behaviour
enum AnimationTimingFunction {
  /// Linear timing function
  linear(0),

  /// Ease-in timing function
  ease_in(1),

  /// Ease-out timing function
  ease_out(2);

  /// The value used by aRdent to identify the animation
  final int id;

  const AnimationTimingFunction(this.id);
}
