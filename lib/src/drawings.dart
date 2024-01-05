import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'commands.dart';
import 'fonts.dart';
import 'helpers.dart';
import 'icons.dart';
import 'screen.dart';

/// A drawing that can be displayed on a pair of aRdent smart glasses
@immutable
abstract class GYWDrawing {
  /// The distance (in pixels) from the top of the screen
  final int top;

  /// The distance (in pixels) from the left side of the screen
  final int left;

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
      case WhiteScreen.type:
        return WhiteScreen.fromJson(data);
      case BlankScreen.type:
        return BlankScreen.fromJson(data);
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

  /// The color of the text (in 8-characters ORGB format)
  final String? color;

  /// The maximum width (in pixels) of the text.
  ///
  /// It will be wrapped on multiple lines if it is too long.
  final int? maxWidth;

  /// The maximum number of lines the text can be wrapped on.
  ///
  /// All extra lines will be ignored.
  /// The value 0 is special and disables the limit.
  final int maxLines;

  const TextDrawing({
    required this.text,
    this.font,
    this.size,
    this.color,
    this.maxWidth,
    this.maxLines = 1,
    super.left = 0,
    super.top = 0,
  });

  @override
  List<GYWBtCommand> toCommands() {
    final int fontSize = size ?? font?.size ?? GYWFont.small.size;
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

    final int fontSize = size ?? font?.size ?? GYWFont.small.size;
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
    controlBytes.add(int32Bytes(left));
    controlBytes.add(int32Bytes(top));

    controlBytes.add(utf8.encode(font?.prefix ?? "NUL"));
    controlBytes.add(int8Bytes(size ?? 0));

    String shortColor = "NULL";
    if (color != null) {
      shortColor = color![0] + color![2] + color![4] + color![6];
    }
    controlBytes.add(utf8.encode(shortColor));

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
    return "Drawing: Text $text at ($left, $top)";
  }

  @override
  bool operator ==(Object other) {
    if (other is TextDrawing) {
      return text == other.text &&
          left == other.left &&
          top == other.top &&
          font == other.font &&
          size == other.size &&
          color == other.color &&
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
      font = GYWFont.values.firstWhere(
        (e) => e.index == data["font"] || e.name == data["font"],
      );
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
      color: data["color"] as String?,
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
      if (font != null) "font": font!.index,
      "size": size,
      "color": color,
      "max_width": maxWidth,
      "max_lines": maxLines,
    };
  }
}

/// A drawing to reset the screen of the aRdent device to a white screen
@Deprecated(
  "WhiteScreen has been replaced by BlankScreen "
  "who has a variable background color",
)
class WhiteScreen extends GYWDrawing {
  /// The type of the [WhiteScreen] drawing
  static const String type = "white_screen";

  @Deprecated(
    "WhiteScreen has been replaced by BlankScreen "
    "who has a variable background color",
  )
  const WhiteScreen();

  @override
  List<GYWBtCommand> toCommands() {
    return [
      GYWBtCommand(
        GYWCharacteristic.ctrlDisplay,
        int8Bytes(GYWControlCode.clear.value),
      ),
    ];
  }

  @override
  String toString() {
    return "Drawing: white screen";
  }

  /// Deserializes a [WhiteScreen] from JSON data
  @Deprecated(
    "WhiteScreen has been replaced by BlankScreen "
    "who has a variable background color",
  )
  // ignore: avoid_unused_constructor_parameters
  factory WhiteScreen.fromJson(Map<String, dynamic> data) {
    return const WhiteScreen();
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type,
    };
  }
}

/// A drawing to reset the content of the screen and its background color
@immutable
class BlankScreen extends GYWDrawing {
  /// The type of the [BlankScreen] drawing
  static const String type = "blank_screen";

  /// The hexadecimal code of the background color
  final String? color;

  const BlankScreen({this.color});

  @override
  List<GYWBtCommand> toCommands() {
    final controlBytes = BytesBuilder();
    controlBytes.add(int8Bytes(GYWControlCode.clear.value));

    if (color != null) {
      // Add color value
      controlBytes.add(utf8.encode(color!));
    }

    return [
      GYWBtCommand(
        GYWCharacteristic.ctrlDisplay,
        controlBytes.toBytes(),
      ),
    ];
  }

  @override
  String toString() {
    return "Drawing: blank screen";
  }

  /// Deserializes a [BlankScreen] from JSON data
  factory BlankScreen.fromJson(Map<String, dynamic> data) {
    return BlankScreen(
      color: data["color"] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "color": color,
    };
  }

  @override
  bool operator ==(Object other) {
    if (other is BlankScreen) {
      return color == other.color;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => 23 * color.hashCode;
}

/// A drawing to display an icon on an aRdent device
@immutable
class IconDrawing extends GYWDrawing {
  /// The type of the [IconDrawing]
  static const String type = "icon";

  /// whether the drawings uses a icon that is not part of the library
  bool get isCustom => icon == null;

  /// The filename of the icon.
  String get iconFilename => icon?.filename ?? customIconFilename!;

  /// The displayed [GYWIcon]
  final GYWIcon? icon;

  /// If [icon] is null, this is a custom icon the library doesn't know about.
  ///
  /// The name of this icon will be stored in this field instead.
  final String? customIconFilename;

  /// Hexadecimal code of the icon fill color
  final String? color;

  /// The icon scaling factor.
  ///
  /// Minimum is 0.01, maximum is 13.7.
  final double scale;

  const IconDrawing(
    GYWIcon this.icon, {
    super.top,
    super.left,
    this.color,
    this.scale = 1.0,
  }) : customIconFilename = null;

  /// Creates a custom icon, i.e. an icon whose image is not in the library
  const IconDrawing.custom(
    String this.customIconFilename, {
    super.top,
    super.left,
    this.color,
    this.scale = 1.0,
  }) : icon = null;

  @override
  List<GYWBtCommand> toCommands() {
    final controlBytes = BytesBuilder();
    controlBytes.add(int8Bytes(GYWControlCode.displayImage.value));
    controlBytes.add(int32Bytes(left));
    controlBytes.add(int32Bytes(top));
    controlBytes.add(utf8.encode(color ?? "NULLNULL"));
    controlBytes.add(byteFromScale(scale));

    return <GYWBtCommand>[
      GYWBtCommand(
        GYWCharacteristic.nameDisplay,
        const Utf8Encoder().convert("$iconFilename.bin"),
      ),
      GYWBtCommand(
        GYWCharacteristic.ctrlDisplay,
        controlBytes.toBytes(),
      ),
    ];
  }

  @override
  String toString() {
    return "Drawing: ${icon?.name ?? customIconFilename} at ($left, $top)";
  }

  @override
  bool operator ==(Object other) {
    if (other is IconDrawing) {
      return iconFilename == other.iconFilename &&
          color == other.color &&
          left == other.left &&
          top == other.top &&
          scale == other.scale;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => Object.hash(
        iconFilename,
        left,
        top,
        color,
        scale,
      );

  /// Deserializes an [IconDrawing] from JSON data
  factory IconDrawing.fromJson(Map<String, dynamic> data) {
    // Deprecated "icon" key will be deprecated in future versions
    final String icon = data["data"] as String? ?? data["icon"] as String;

    final GYWIcon? gywIcon = GYWIcon.values.cast<GYWIcon?>().firstWhere(
          (element) => element!.filename == icon || element.name == icon,
          orElse: () => null,
        );

    if (gywIcon != null) {
      return IconDrawing(
        gywIcon,
        left: data["left"] as int,
        top: data["top"] as int,
        color: data["color"] as String?,
        scale: (data["scale"] as num? ?? 1.0).toDouble(),
      );
    } else {
      return IconDrawing.custom(
        icon,
        left: data["left"] as int,
        top: data["top"] as int,
        color: data["color"] as String?,
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
      // Deprecated: "icon" key will be deprecated in future versions
      "icon": icon?.name ?? customIconFilename,
      "data": iconFilename,
      "color": color,
      "scale": scale,
    };
  }
}

@immutable
class RectangleDrawing extends GYWDrawing {
  /// The type of the [RectangleDrawing].
  static const String type = "rectangle";

  /// The rectangle width.
  final int width;

  /// The rectangle height.
  final int height;

  /// The fill color. If null, the rectangle will use the current background color.
  final String? color;

  const RectangleDrawing({
    required super.left,
    required super.top,
    required this.width,
    required this.height,
    this.color,
  });

  @override
  List<GYWBtCommand> toCommands() {
    final controlBytes = BytesBuilder()
      ..add(int8Bytes(GYWControlCode.drawRectangle.value))
      ..add(uint16Bytes(left))
      ..add(uint16Bytes(top))
      ..add(uint16Bytes(width))
      ..add(uint16Bytes(height))
      ..add(rgba8888BytesFromColorString(color));

    return [
      GYWBtCommand(
        GYWCharacteristic.ctrlDisplay,
        controlBytes.toBytes(),
      ),
    ];
  }

  @override
  String toString() {
    return 'RectangleDrawing{left: $left, top: $top, width: $width, height: $height, color: $color}';
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
          color == other.color;

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
      color: data["color"] as String?,
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
      "color": color,
    };
  }
}

@immutable
class SpinnerDrawing extends GYWDrawing {
  /// The type of the [SpinnerDrawing].
  static const String type = "spinner";

  /// The scale of the image.
  final num scale;

  /// The fill color. If null, the image colors will be preserved.
  final String? color;

  /// The curve applied while spinning.
  final AnimationTimingFunction animationTimingFunction;

  /// How many rotations per second.
  final num spinsPerSecond;

  const SpinnerDrawing({
    required super.left,
    required super.top,
    this.scale = 1,
    this.color,
    this.animationTimingFunction = AnimationTimingFunction.linear,
    this.spinsPerSecond = 1,
  });

  @override
  List<GYWBtCommand> toCommands() {
    final controlBytes = BytesBuilder()
      ..add(int8Bytes(GYWControlCode.displaySpinner.value))
      ..add(uint16Bytes(left))
      ..add(uint16Bytes(top))
      ..add(rgba8888BytesFromColorString(color))
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
    return '''
SpinnerDrawing{
  left: $left,
  top: $top,
  color: $color,
  scale: $scale,
  animationTimingFunction: $animationTimingFunction,
  spinsPerSecond: $spinsPerSecond,
}''';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpinnerDrawing &&
          runtimeType == other.runtimeType &&
          left == other.left &&
          top == other.top &&
          scale == other.scale &&
          color == other.color &&
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
      scale: data["scale"] as num,
      color: data["color"] as String?,
      animationTimingFunction: AnimationTimingFunction.values.firstWhere(
        (element) =>
            element.name == data["animation_timing_function"] as String,
      ),
      spinsPerSecond: data["spins_per_second"] as num,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "left": left,
      "top": top,
      "scale": scale,
      "color": color,
      "animation_timing_function": animationTimingFunction.name,
      "spins_per_second": spinsPerSecond,
    };
  }
}

enum AnimationTimingFunction {
  linear(0, "linear"),
  ease_in(1, "ease-in"),
  ease_out(2, "ease-out");

  final int id;
  final String name;

  const AnimationTimingFunction(this.id, this.name);
}
