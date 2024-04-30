import "package:flutter/material.dart";

/// The text fonts supported on aRdent smart glasses
@immutable
class GYWFont {
  /// The name of the font
  final String name;

  /// The font filename on the GYW device
  final String filename;

  /// Whether the fontweight is bold (w700) or normal (w400)
  final bool bold;

  /// Whether the font style is italic.
  final bool italic;

  final String pathTtf;

  /// Creates a font.
  const GYWFont({
    required this.name,
    required this.filename,
    required this.pathTtf,
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
  robotoMonoNormal(
    GYWFont(
      name: "Roboto Mono Normal",
      filename: "robmn",
      pathTtf: "assets/fonts/RobotoMono-Regular.ttf",
    ),
  ),

  /// Roboto Mono Bold
  robotoMonoBold(
    GYWFont(
      name: "Roboto Mono Bold",
      filename: "robmb",
      pathTtf: "assets/fonts/RobotoMono-Bold.ttf",
      bold: true,
    ),
  ),

  /// Roboto Mono Italic
  robotoMonoItalic(
    GYWFont(
      name: "Roboto Mono Italic",
      filename: "robmi",
      pathTtf: "assets/fonts/RobotoMono-Italic.ttf",
      italic: true,
    ),
  );

  /// The [GYWFont] object to use for aRdent communication.
  final GYWFont font;

  const GYWFonts(this.font);
}
