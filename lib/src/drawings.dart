import "dart:convert";
import "dart:typed_data";

import "package:dart_mappable/dart_mappable.dart";
import "package:flutter/material.dart";
import "package:flutter_gyw/src/custom_mappers.dart";
import "package:flutter_gyw/src/helpers.dart";

import "commands.dart";
import "fonts.dart";
import "icons.dart";
import "screen.dart";

part "drawings.mapper.dart";

/// A drawing that can be displayed on a pair of aRdent smart glasses
@immutable
@MappableClass(
  discriminatorKey: "type",
  includeCustomMappers: [
    GYWIconMapper(),
    GYWFontMapper(),
  ],
)
sealed class GYWDrawing with GYWDrawingMappable {
  /// The distance (in pixels) from the top of the screen
  final int top;

  /// The distance (in pixels) from the left side of the screen
  final int left;

  /// Abstract const contructor.
  const GYWDrawing({
    this.top = 0,
    this.left = 0,
  });

  /// Deserializes a drawing from a map
  static const fromMap = GYWDrawingMapper.fromMap;

  /// Deserializes a drawing from a JSON string
  static const fromJson = GYWDrawingMapper.fromJson;

  /// Converts the drawing into a list of commands understood by the device
  List<GYWBtCommand> toCommands();
}

/// A drawing to display text on an aRdent device
@MappableClass()
class TextDrawing extends GYWDrawing with TextDrawingMappable {
  /// The text that must be displayed
  final String text;

  /// Returns the text wrapped on multiple lines constrained by [maxWidth] and [maxLines].
  String get wrappedText => _wrapText().join("\n");

  /// The [GYWFont] to use
  final GYWFont font;

  /// The text size.
  final int size;

  /// Text color in hexadecimal format.
  final int colorHex;

  /// Text color.
  Color get color => Color(colorHex);

  /// The maximum width (in pixels) of the text.
  ///
  /// It will be wrapped on multiple lines if it is too long.
  /// Null disables the limit.
  final int? maxWidth;

  /// The maximum number of lines the text can be wrapped on.
  ///
  /// All extra lines will be ignored.
  /// Null disables the limit.
  final int? maxLines;

  /// Creates a text element.
  TextDrawing({
    required this.text,
    this.font = robotoMonoFont,
    this.size = 24,
    this.colorHex = 0xFF000000, // black
    this.maxWidth,
    this.maxLines = 1,
    super.left = 0,
    super.top = 0,
  });

  /// Deserializes a text drawing from a map
  static const fromMap = TextDrawingMapper.fromMap;

  /// Deserializes a text drawing from a JSON string
  static const fromJson = TextDrawingMapper.fromJson;

  @override
  List<GYWBtCommand> toCommands() {
    final int charHeight = (size * pixelsPerPoint).ceil();

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

    final int charWidth = (size * font.charWidth).ceil();
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

    controlBytes.add(utf8.encode(font.filename));
    controlBytes.add(int8Bytes(size));

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
}

/// A drawing to display an icon on an aRdent device
@MappableClass()
class IconDrawing extends GYWDrawing with IconDrawingMappable {
  /// The displayed [GYWIcon]
  final GYWIcon icon;

  /// Hexadecimal code of the icon fill color
  final int colorHex;

  /// Fill color.
  Color get color => Color(colorHex);

  /// The icon scaling factor.
  ///
  /// Minimum is 0.01, maximum is 13.7.
  final double scale;

  /// Creates an icon element.
  const IconDrawing(
    this.icon, {
    super.top,
    super.left,
    this.colorHex = 0xFF000000,
    this.scale = 1.0,
  });

  /// Deserializes an icon drawing from a map
  static const fromMap = IconDrawingMapper.fromMap;

  /// Deserializes an icon drawing from a JSON string
  static const fromJson = IconDrawingMapper.fromJson;

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
}

/// A drawing to display a rectangle on an aRdent device
@MappableClass()
class RectangleDrawing extends GYWDrawing with RectangleDrawingMappable {
  /// The rectangle width.
  final int width;

  /// The rectangle height.
  final int height;

  /// The fill color. If null, the rectangle will use the current background color.
  final int? colorHex;

  /// Fill color.
  Color? get color => colorHex != null ? Color(colorHex!) : null;

  /// Creates a rectangle element.
  const RectangleDrawing({
    super.left,
    super.top,
    required this.width,
    required this.height,
    this.colorHex,
  });

  /// Deserializes a rectangle drawing from a map
  static const fromMap = RectangleDrawingMapper.fromMap;

  /// Deserializes a rectangle drawing from a JSON string
  static const fromJson = RectangleDrawingMapper.fromJson;

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
}

/// A drawing to display a spinner on an aRdent device
@MappableClass()
class SpinnerDrawing extends GYWDrawing with SpinnerDrawingMappable {
  /// The scale of the image.
  final double scale;

  /// The fill color. If null, the image colors will be preserved.
  final int? colorHex;

  /// Fill color.
  Color? get color => colorHex != null ? Color(colorHex!) : null;

  /// The curve applied while spinning.
  final AnimationTimingFunction animationTimingFunction;

  /// How many rotations per second.
  final double spinsPerSecond;

  /// Creates a spinner element.
  const SpinnerDrawing({
    super.left,
    super.top,
    this.scale = 1.0,
    this.colorHex,
    this.animationTimingFunction = AnimationTimingFunction.linear,
    this.spinsPerSecond = 1.0,
  });

  /// Deserializes a spinner drawing from a map
  static const fromMap = SpinnerDrawingMapper.fromMap;

  /// Deserializes a spinner drawing from a JSON string
  static const fromJson = SpinnerDrawingMapper.fromJson;

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
