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
  blank("Blank", "blank"),
  key_0("Key 0", "key_0"),
  key_1("Key 1", "key_1"),
  key_2("Key 2", "key_2"),
  key_3("Key 3", "key_3"),
  key_4("Key 4", "key_4"),
  key_5("Key 5", "key_5"),
  key_6("Key 6", "key_6"),
  key_7("Key 7", "key_7"),
  key_8("Key 8", "key_8"),
  key_9("Key 9", "key_9"),
  key_A("Key A", "key_A"),
  key_B("Key B", "key_B"),
  key_C("Key C", "key_C"),
  key_D("Key D", "key_D"),
  key_star("Key *", "key_star"),
  key_num("Key #", "key_#"),
  construction("Construction", "construction"),
  help("Help", "help"),
  camera("Camera", "camera");

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
