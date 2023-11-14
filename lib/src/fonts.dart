/// The text fonts supported on aRdent smart glasses
enum GYWFont {
  small("Small", "a10", 18, 10, 25),
  medium("Medium", "b14", 24, 14, 33, true),
  large("Large", "a16", 28, 16, 39),
  huge("Huge", "b28", 48, 28, 67, true);

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

  const GYWFont(
    this.name,
    this.prefix, [
    this.size = 12,
    this.width = 12,
    this.height = 20,
    this.bold = false,
  ]);
}
