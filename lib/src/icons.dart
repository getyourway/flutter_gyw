/// Representation of an icon for an aRdent device
class GYWIcon {
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

/// Icons supported by aRdent devices
class GYWIcons {
  // Icons from Google Icons
  static const GYWIcon down = GYWIcon("Down", "down");
  static const GYWIcon left = GYWIcon("Left", "left");
  static const GYWIcon right = GYWIcon("Right", "right");
  static const GYWIcon up = GYWIcon("Up", "up");
  static const GYWIcon next = GYWIcon("Next", "next");
  static const GYWIcon previous = GYWIcon("Previous", "prev");
  static const GYWIcon checkbox = GYWIcon("Checkbox checked", "check");
  static const GYWIcon checkboxEmpty = GYWIcon("Checkbox empty", "uncheck");
  static const GYWIcon done = GYWIcon("Done", "done");
  static const GYWIcon edit = GYWIcon("Edit", "edit");
  static const GYWIcon rename = GYWIcon("Rename", "rename");
  static const GYWIcon file = GYWIcon("File", "file");
  static const GYWIcon location = GYWIcon("Location", "location");
  static const GYWIcon info = GYWIcon("Information", "info");
  static const GYWIcon blank = GYWIcon("Blank", "blank");

  /// List of all icons
  static const List<GYWIcon> values = [
    down,
    up,
    right,
    left,
    next,
    previous,
    checkbox,
    checkboxEmpty,
    done,
    edit,
    rename,
    file,
    location,
    info,
    blank,
  ];
}
