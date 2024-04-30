import "package:flutter/material.dart";

/// The text fonts supported on aRdent smart glasses
@immutable
class GYWFont {
  /// The name of the font
  final String name;

  /// The font filename on the GYW device
  final String filename;

  /// Creates a font.
  const GYWFont({
    required this.name,
    required this.filename,
  });

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
    ),
  ),

  /// Roboto Mono Bold
  robotoMonoBold(
    GYWFont(
      name: "Roboto Mono Bold",
      filename: "robmb",
    ),
  );

  /// The [GYWFont] object to use for aRdent communication.
  final GYWFont font;

  const GYWFonts(this.font);
}
