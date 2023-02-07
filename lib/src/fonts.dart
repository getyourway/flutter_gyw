/// Representation of an icon for an aRdent device
class GYWFont {
  /// Index value transmitted to the device
  final int index;

  /// Name of the font
  final String name;

  /// Internal prefix of the font
  final String prefix;

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
    this.width = 12,
    this.height = 12,
    this.bold = false,
  ]);

  @override
  bool operator ==(Object other) => other is GYWFont && other.index == index;

  @override
  int get hashCode => index;
}

/// Fonts supported by aRdent devices
class GYWFonts {
  static const basic = GYWFont("Basic", "nba", 0, 14, 19, false);
  static const title = GYWFont("Title", "nti", 1, 20, 28, true);
  static const bigBasic = GYWFont("Big basic", "bba", 2, 28, 39, false);
  static const bigTitle = GYWFont("Big title", "bti", 3, 42, 58, true);

  static const values = [basic, title, bigBasic, bigTitle];
}
