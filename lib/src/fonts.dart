/// Representation of an icon for an aRdent device
class GYWFont {
  /// Index value transmitted to the device
  final int index;

  /// Internal name of the font
  final String name;

  /// Width (in pixels) of a character
  final int width;

  /// Height (in pixels) of a character
  final int height;

  /// Whether the fontweight is bold (w700) or normal (w400)
  final bool bold;

  const GYWFont(
    this.name,
    this.index, [
    this.width = 12,
    this.height = 12,
    this.bold = false,
  ]);
}

/// Fonts supported by aRdent devices
class GYWFonts {
  static const basic = GYWFont("basic", 0, 14, 22, false);
  static const title = GYWFont("title", 1, 20, 31, true);
  static const bigBasic = GYWFont("big_basic", 2, 29, 47, false);
  static const bigTitle = GYWFont("big_title", 3, 42, 71, true);

  static const values = [basic, title, bigBasic, bigTitle];
}
