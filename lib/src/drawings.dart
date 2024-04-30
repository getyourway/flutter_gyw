import "dart:convert";
import "dart:typed_data";

import "package:flutter/material.dart";
import "package:flutter_gyw/flutter_gyw.dart";
import "package:flutter_gyw/src/helpers.dart";
import "package:freezed_annotation/freezed_annotation.dart";

import "commands.dart";

part "drawings.freezed.dart";

/// A drawing that can be displayed on a pair of aRdent smart glasses
abstract interface class GYWDrawing {
  /// The distance (in pixels) from the top of the screen
  int get top;

  /// The distance (in pixels) from the left side of the screen
  int get left;

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
@freezed
class TextDrawing with _$TextDrawing implements GYWDrawing {
  /// The type of the [TextDrawing] drawing
  static const String type = "text";

  /// Factory constructor for creating a new [TextDrawing] instance
  const factory TextDrawing({
    @Default(0) int top,
    @Default(0) int left,

    /// The text that must be displayed
    required String text,

    /// The [GYWFont] to use
    ///
    /// If no font is given, it uses the most recent one
    GYWFont? font,

    /// The text size. Overrides the font size.
    int? size,

    /// The color of the text.
    @Default(Colors.black) Color color,

    /// The maximum width (in pixels) of the text.
    ///
    /// It will be wrapped on multiple lines if it is too long.
  /// Null disables the limit.
  int? maxWidth,

    /// The maximum number of lines the text can be wrapped on.
    ///
    /// All extra lines will be ignored.
    /// Null disables the limit.
    int? maxLines,
  }) = _TextDrawing;

  const TextDrawing._();

  /// Returns the text wrapped on multiple lines constrained by [maxWidth] and [maxLines].
  String get wrappedText => _wrapText().join("\n");

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
        this.maxWidth != null && this.maxWidth! >= 1 ? this.maxWidth : null;

    final int? maxLines =
        this.maxLines != null && this.maxLines! >= 1 ? this.maxLines : null;

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
        if (maxLines != null && lines >= maxLines) {
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
      maxLines: data["max_lines"] as int?,
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
@freezed
class IconDrawing with _$IconDrawing implements GYWDrawing {
  /// The type of the [IconDrawing]
  static const String type = "icon";

  /// Factory constructor for creating a new [IconDrawing] instance
  const factory IconDrawing({
    @Default(0) int top,
    @Default(0) int left,

    /// The displayed [GYWIcon]
    required GYWIcon icon,

    /// Hexadecimal code of the icon fill color
    @Default(Colors.black) Color color,

    /// The icon scaling factor.
    @Default(1.0) double scale,
  }) = _IconDrawing;

  const IconDrawing._();

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
        icon: gywIcon,
        left: data["left"] as int,
        top: data["top"] as int,
        color: colorFromHex(data["color"] as String?) ?? Colors.black,
        scale: (data["scale"] as num? ?? 1.0).toDouble(),
      );
    } else {
      return IconDrawing(
        icon: GYWIcon(name: icon, filename: icon),
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
@freezed
class RectangleDrawing with _$RectangleDrawing implements GYWDrawing {
  /// The type of the [RectangleDrawing].
  static const String type = "rectangle";

  /// Factory constructor for creating a new [RectangleDrawing] instance
  const factory RectangleDrawing({
    @Default(0) int top,
    @Default(0) int left,

    /// The rectangle width.
    required int width,

    /// The rectangle height.
    required int height,

    /// The fill color. If null, the rectangle will use the current background color.
    Color? color,
  }) = _RectangleDrawing;

  const RectangleDrawing._();

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
@freezed
class SpinnerDrawing with _$SpinnerDrawing implements GYWDrawing {
  /// The type of the [SpinnerDrawing].
  static const String type = "spinner";

  /// Factory constructor for creating a new [SpinnerDrawing] instance
  const factory SpinnerDrawing({
    @Default(0) int top,
    @Default(0) int left,

    /// The scale of the image.
    @Default(1.0) double scale,

    /// The fill color. If null, the image colors will be preserved.
    Color? color,

    /// The curve applied while spinning.
    @Default(AnimationTimingFunction.linear)
    AnimationTimingFunction animationTimingFunction,

    /// How many rotations per second.
    @Default(1.0) double spinsPerSecond,
  }) = _SpinnerDrawing;

  const SpinnerDrawing._();

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
