class GYWFont {
  /// Index value transmitted to the device
  final int index;

  /// Width (in pixels) of a character
  final int width;

  /// Height (in pixels) of a character
  final int height;

  /// Whether the fontweight is bold (w700) or normal (w400)
  final bool bold;

  const GYWFont(
    this.index, [
    this.width = 12,
    this.height = 12,
    this.bold = false,
  ]);
}

class GYWFonts {
  static const basic = GYWFont(0, 14, 14, false);
  static const title = GYWFont(1, 18, 18, true);
  static const bigBasic = GYWFont(2, 30, 60, false);
  static const bigTitle = GYWFont(3, 50, 90, true);
}
