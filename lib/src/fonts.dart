import "package:flutter/material.dart";

/// The text fonts supported on aRdent smart glasses
@immutable
class GYWFont {
  /// The name of the font
  final String name;

  /// The internal prefix of the font
  final String prefix;

  /// The size (in points) of a character
  final int size;

  /// The width (in pixels) of a character
  final int width;

  /// The height (in pixels) of a character
  final int height;

  /// Whether the fontweight is bold (w700) or normal (w400)
  final bool bold;

  /// Creates a font.
  const GYWFont({
    required this.name,
    required this.prefix,
    required this.size,
    required this.width,
    required this.height,
    required this.bold,
  });

  @override
  String toString() {
    return "Font '$name' ($prefix)";
  }

  @override
  bool operator ==(Object other) {
    if (other is GYWFont) {
      return prefix == other.prefix;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => Object.hash(prefix, size);
}

/// The [GYWFont] fonts supported by default on aRdent smart glasses.
enum GYWFonts {
  /// For small texts with a low significance.
  small(
    GYWFont(
      name: "Small",
      prefix: "a10",
      size: 18,
      width: 10,
      height: 25,
      bold: false,
    ),
  ),

  /// For common texts with a medium significance.
  medium(
    GYWFont(
      name: "Medium",
      prefix: "b14",
      size: 24,
      width: 14,
      height: 33,
      bold: true,
    ),
  ),

  /// For common texts with a medium significance.
  large(
    GYWFont(
      name: "Large",
      prefix: "a16",
      size: 28,
      width: 16,
      height: 39,
      bold: false,
    ),
  ),

  /// For important texts with major significance for the user.
  huge(
    GYWFont(
      name: "Huge",
      prefix: "b28",
      size: 48,
      width: 28,
      height: 67,
      bold: true,
    ),
  );

  /// The [GYWFont] object to use for aRdent communication.
  final GYWFont font;

  const GYWFonts(this.font);
}
