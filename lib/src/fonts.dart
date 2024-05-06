import "package:flutter/material.dart";

/// Pixels per point constant.
/// In CSS:
/// pt = 1/72 inch
/// px = 1/96 inch
const double pixelsPerPoint = 96.0 / 72.0; // 1.333(3)

/// The text fonts supported on aRdent smart glasses
@immutable
class GYWFont {
  /// The font filename on the GYW device (5 characters long and no type extension).
  final String filename;

  /// The name of the font.
  final String? name;

  /// The font family name.
  final String? fontFamily;

  /// The width of a character at 1pt.
  final double charWidth;

  /// Whether the fontweight is bold (w700) or normal (w400).
  final bool bold;

  /// Whether the font style is italic.
  final bool italic;

  /// Creates a font.
  const GYWFont({
    required this.filename,
    this.name,
    this.fontFamily,
    this.charWidth = 0.6,
    this.bold = false,
    this.italic = false,
  }) : assert(filename.length == 5, "The filename must be 5 characters long");

  @override
  String toString() {
    return "Font '$name' ($filename)";
  }

  @override
  bool operator ==(Object other) {
    if (other is GYWFont) {
      return filename == other.filename;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => Object.hash(name, filename);
}

/// Roboto Mono Normal
/// Work around https://github.com/dart-lang/language/issues/2374
const robotoMonoFont = GYWFont(
  filename: "robmn",
  name: "Roboto Mono",
  fontFamily: "Roboto Mono",
);

/// The [GYWFont] fonts supported by default on aRdent smart glasses.
enum GYWFonts {
  /// Roboto Mono Normal
  robotoMono(robotoMonoFont),

  /// Roboto Mono Bold
  robotoMonoBold(
    GYWFont(
      filename: "robmb",
      name: "Roboto Mono Bold",
      fontFamily: "Roboto Mono",
      bold: true,
    ),
  ),

  /// Roboto Mono Italic
  robotoMonoItalic(
    GYWFont(
      filename: "robmi",
      name: "Roboto Mono Italic",
      fontFamily: "Roboto Mono",
      italic: true,
    ),
  );

  /// The [GYWFont] object to use for aRdent communication.
  final GYWFont font;

  const GYWFonts(this.font);
}
