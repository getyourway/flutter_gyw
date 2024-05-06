import "dart:convert";
import "dart:typed_data";

import "package:flutter/material.dart";
import "package:flutter_gyw/flutter_gyw.dart";
import "package:flutter_gyw/src/fonts.dart";
import "package:flutter_gyw/src/helpers.dart";
import "package:flutter_gyw/src/icons.dart";
import "package:freezed_annotation/freezed_annotation.dart";

import "commands.dart";

part "drawings.freezed.dart";

part "drawings.g.dart";

/// A drawing to display text on an aRdent device
@Freezed(unionValueCase: FreezedUnionCase.pascal)
sealed class GYWDrawing with _$GYWDrawing {
  const factory GYWDrawing.textDrawing({
    @Default(0) int top,
    @Default(0) int left,

    /// The text that must be displayed
    required String text,

    /// The [GYWFont] to use
    ///
    /// If no font is given, it uses the most recent one
    @GYWFontJsonConverter() GYWFont? font,

    /// The text size. Overrides the font size.
    int? size,

    /// The color of the text.
    @Default(0xFF000000 /* black */) int colorHex,

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
  }) = TextDrawing;

  const factory GYWDrawing.iconDrawing({
    @Default(0) int top,
    @Default(0) int left,

    /// The displayed [GYWIcon]
    @GYWIconJsonConverter() required GYWIcon icon,

    /// Hexadecimal code of the icon fill color
    @Default(0xFF000000 /* black */) int colorHex,

    /// The icon scaling factor.
    @Default(1.0) double scale,
  }) = IconDrawing;

  const factory GYWDrawing.rectangleDrawing({
    @Default(0) int top,
    @Default(0) int left,

    /// The rectangle width.
    required int width,

    /// The rectangle height.
    required int height,

    /// The fill color. If null, the rectangle will use the current background color.
    int? colorHex,
  }) = RectangleDrawing;

  const factory GYWDrawing.spinnerDrawing({
    @Default(0) int top,
    @Default(0) int left,

    /// The scale of the image.
    @Default(1.0) double scale,

    /// The fill color. If null, the image colors will be preserved.
    int? colorHex,

    /// The curve applied while spinning.
    @Default(AnimationTimingFunction.linear)
    AnimationTimingFunction animationTimingFunction,

    /// How many rotations per second.
    @Default(1.0) double spinsPerSecond,
  }) = SpinnerDrawing;

  const GYWDrawing._();

  factory GYWDrawing.fromJson(Map<String, dynamic> json) =>
      _$GYWDrawingFromJson(json);

  /// Converts the drawing to a list of aRdent commands.
  List<GYWBtCommand> toCommands() {
    // Dart can only downcast local variables, not `this`.
    final drawing = this;

    switch (drawing) {
      case TextDrawing(
          :final font,
          :final size,
        ):
        final int fontSize = size ?? font?.size ?? GYWFonts.small.font.size;
        final int charHeight = (fontSize * 1.33).ceil();

        final List<GYWBtCommand> commands = [];

        int currentTop = top;
        for (final String line in drawing._wrapText()) {
          commands.addAll(drawing._lineToCommands(line, currentTop));
          currentTop += charHeight;
        }
        return commands;

      case IconDrawing(
          :final color,
          :final scale,
          :final icon,
        ):
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

      case RectangleDrawing(
          :final width,
          :final height,
          :final color,
        ):
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

      case SpinnerDrawing(
          :final scale,
          :final color,
          :final animationTimingFunction,
          :final spinsPerSecond,
        ):
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
}

/// Helper functions for the [TextDrawing] class.
extension TextDrawingExtension on TextDrawing {
  /// Returns the text wrapped on multiple lines constrained by [maxWidth] and [maxLines].
  String get wrappedText => _wrapText().join("\n");

  /// Returns a Flutter Color from the hexadecimal color code.
  Color get color => Color(colorHex);

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
}

/// Helper functions for the [IconDrawing] class.
extension IconDrawingExtension on IconDrawing {
  /// Returns a Flutter Color from the hexadecimal color code.
  Color get color => Color(colorHex);
}

/// Helper functions for the [RectangleDrawing] class.
extension RectangleDrawingExtension on RectangleDrawing {
  /// Returns a Flutter Color from the hexadecimal color code.
  Color? get color => colorHex != null ? Color(colorHex!) : null;
}

/// Helper functions for the [SpinnerDrawing] class.
extension SpinnerDrawingExtension on SpinnerDrawing {
  /// Returns a Flutter Color from the hexadecimal color code.
  Color? get color => colorHex != null ? Color(colorHex!) : null;
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
