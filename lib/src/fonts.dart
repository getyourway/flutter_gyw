/// Representation of an icon for an aRdent device
class GYWFont {
  /// Index value transmitted to the device
  final int index;

  /// Name of the font
  final String name;

  /// Internal prefix of the font
  final String prefix;

  /// Size (in points) of a character
  final int size;

  /// Width (in pixels) of a character
  final int width;

  /// Height (in pixels) of a character
  final int height;

  /// Whether the fontweight is bold (w700) or normal (w400)
  final bool bold;

  const GYWFont(
    this.name,
    this.prefix,
    this.index, [
    this.size = 12,
    this.width = 12,
    this.height = 20,
    this.bold = false,
  ]);

  @override
  bool operator ==(Object other) => other is GYWFont && other.index == index;

  @override
  int get hashCode => index;
}

/// Fonts supported by aRdent devices
class GYWFonts {
  static const small = GYWFont("Small", "a10", 0, 18, 10, 25);
  static const medium = GYWFont("Medium", "b14", 1, 24, 14, 33, true);
  static const large = GYWFont("Large", "a16", 2, 28, 16, 39);
  static const huge = GYWFont("Huge", "b28", 3, 48, 28, 67, true);

  /// Every fonts available
  static const values = [small, medium, large, huge];
}
