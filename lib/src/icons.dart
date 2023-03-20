/// Icons supported by aRdent smart glasses
enum GYWIcon {
  down("Down", "down"),
  left("Left", "left"),
  right("Right", "right"),
  up("Up", "up"),
  next("Next", "next"),
  previous("Previous", "prev"),
  checkbox("Checkbox checked", "check"),
  checkboxEmpty("Checkbox empty", "uncheck"),
  done("Done", "done"),
  edit("Edit", "edit"),
  rename("Rename", "rename"),
  file("File", "file"),
  location("Location", "location"),
  info("Information", "info"),
  blank("Blank", "blank");

  /// Name of the icon
  final String name;

  /// Filename on the GYW device
  final String filename;

  const GYWIcon(
    this.name,
    this.filename,
  );

  /// Path of the associated file in the assets folder
  String get path => "assets/icons/$filename.png";

  /// Width (in pixel) of the icon
  double get width => 48.0;

  /// Height (in pixel) of the icon
  double get height => 48.0;
}
