import "package:flutter/material.dart";

/// Pixels per point constant.
/// In CSS:
/// pt = 1/72 inch
/// px = 1/96 inch
const double pixelsPerPoint = 96.0 / 72.0; // 1.333(3)

/// The text fonts supported on aRdent smart glasses
@immutable
class GYWFont {
  /// The name of the font.
  final String name;

  /// The font filename on the GYW device (5 characters-long and no type extension).
  final String filename;

  /// Whether the fontweight is bold (w700) or normal (w400).
  final bool bold;

  /// Whether the font style is italic.
  final bool italic;

  /// The path to the TTF file in the assets folder.
  final String pathTtf;

  /// The aspect ratio of the font.
  final double aspectRatio;

  /// Creates a font.
  const GYWFont({
    required this.name,
    required this.filename,
    required this.pathTtf,
    required this.aspectRatio,
    this.bold = false,
    this.italic = false,
  }) : assert(filename.length == 5);

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

/// The [GYWFont] fonts supported by default on aRdent smart glasses.
enum GYWFonts {
  /// Roboto Mono Normal
  robotoMono(
    GYWFont(
      name: "Roboto Mono Normal",
      filename: "robmn",
      pathTtf: "assets/fonts/RobotoMono-Regular.ttf",
      aspectRatio: 0.45,
    ),
  ),

  /// Roboto Mono Bold
  robotoMonoBold(
    GYWFont(
      name: "Roboto Mono Bold",
      filename: "robmb",
      pathTtf: "assets/fonts/RobotoMono-Bold.ttf",
      bold: true,
      aspectRatio: 0.45,
    ),
  ),

  /// Roboto Mono Italic
  robotoMonoItalic(
    GYWFont(
      name: "Roboto Mono Italic",
      filename: "robmi",
      pathTtf: "assets/fonts/RobotoMono-Italic.ttf",
      italic: true,
      aspectRatio: 0.45,
    ),
  );

  /// The [GYWFont] object to use for aRdent communication.
  final GYWFont font;

  const GYWFonts(this.font);
}
