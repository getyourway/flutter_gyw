class GYWIcon {
  /// The name of the icon
  final String name;

  /// The filename on the GYW device
  final String filename;

  /// The width (in pixels) of the icon
  final double width;

  /// The height (in pixels) of the icon
  final double height;

  const GYWIcon({
    required this.name,
    required this.filename,
    required this.width,
    required this.height,
  });

  /// The path of the associated file in the assets folder
  @Deprecated("Use pathPng instead")
  String get path => "assets/icons/$filename.png";

  /// The path of the associated PNG file in the assets folder
  String get pathPng => "assets/icons/$filename.png";

  /// The path of the associated SVG file in the assets folder
  String get pathSvg => "assets/icons/$filename.svg";
}

/// The icons supported by aRdent smart glasses
enum GYWIcons {
  blank(
    GYWIcon(
      name: "Blank",
      filename: "blank",
      width: 48,
      height: 48,
    ),
  ),
  build(
    GYWIcon(
      name: "Build",
      filename: "build",
      width: 48,
      height: 48,
    ),
  ),
  camera(
    GYWIcon(
      name: "Camera",
      filename: "camera",
      width: 48,
      height: 48,
    ),
  ),
  chat(
    GYWIcon(
      name: "Chat",
      filename: "chat",
      width: 48,
      height: 48,
    ),
  ),
  checkbox(
    GYWIcon(
      name: "Checkbox checked",
      filename: "check",
      width: 48,
      height: 48,
    ),
  ),
  checkboxEmpty(
    GYWIcon(
      name: "Checkbox empty",
      filename: "uncheck",
      width: 48,
      height: 48,
    ),
  ),
  cloud_backup(
    GYWIcon(
      name: "Cloud backup",
      filename: "cloud_backup",
      width: 48,
      height: 48,
    ),
  ),
  cloud_done(
    GYWIcon(
      name: "Cloud done",
      filename: "cloud_done",
      width: 48,
      height: 48,
    ),
  ),
  done(
    GYWIcon(
      name: "Done",
      filename: "done",
      width: 48,
      height: 48,
    ),
  ),
  down(
    GYWIcon(
      name: "Down",
      filename: "down",
      width: 48,
      height: 48,
    ),
  ),
  edit(
    GYWIcon(
      name: "Edit",
      filename: "edit",
      width: 48,
      height: 48,
    ),
  ),
  file(
    GYWIcon(
      name: "File",
      filename: "file",
      width: 48,
      height: 48,
    ),
  ),
  folder(
    GYWIcon(
      name: "Folder",
      filename: "folder",
      width: 48,
      height: 48,
    ),
  ),
  gyw(
    GYWIcon(
      name: "GYW",
      filename: "GYW",
      width: 121,
      height: 48,
    ),
  ),
  help(
    GYWIcon(
      name: "Help",
      filename: "help",
      width: 48,
      height: 48,
    ),
  ),
  info(
    GYWIcon(
      name: "Information",
      filename: "info",
      width: 48,
      height: 48,
    ),
  ),
  left(
    GYWIcon(
      name: "Left",
      filename: "left",
      width: 48,
      height: 48,
    ),
  ),
  location(
    GYWIcon(
      name: "Location",
      filename: "location",
      width: 48,
      height: 48,
    ),
  ),
  next(
    GYWIcon(
      name: "Next",
      filename: "next",
      width: 48,
      height: 48,
    ),
  ),
  nfc(
    GYWIcon(
      name: "NFC",
      filename: "nfc",
      width: 48,
      height: 48,
    ),
  ),
  person(
    GYWIcon(
      name: "Person",
      filename: "person",
      width: 48,
      height: 48,
    ),
  ),
  previous(
    GYWIcon(
      name: "Previous",
      filename: "prev",
      width: 48,
      height: 48,
    ),
  ),
  rename(
    GYWIcon(
      name: "Rename",
      filename: "rename",
      width: 48,
      height: 48,
    ),
  ),
  right(
    GYWIcon(
      name: "Right",
      filename: "right",
      width: 48,
      height: 48,
    ),
  ),
  settings(
    GYWIcon(
      name: "Settings",
      filename: "settings",
      width: 48,
      height: 48,
    ),
  ),
  up(
    GYWIcon(
      name: "Up",
      filename: "up",
      width: 48,
      height: 48,
    ),
  ),
  warning(
    GYWIcon(
      name: "Warning",
      filename: "warning",
      width: 48,
      height: 48,
    ),
  ),
  wifi(
    GYWIcon(
      name: "Wi-Fi",
      filename: "wifi",
      width: 48,
      height: 48,
    ),
  ),
  wifi_off(
    GYWIcon(
      name: "Wi-Fi off",
      filename: "wifi_off",
      width: 48,
      height: 48,
    ),
  ),
  key_0(
    GYWIcon(
      name: "Key 0",
      filename: "key_0",
      width: 48,
      height: 48,
    ),
  ),
  key_1(
    GYWIcon(
      name: "Key 1",
      filename: "key_1",
      width: 48,
      height: 48,
    ),
  ),
  key_2(
    GYWIcon(
      name: "Key 2",
      filename: "key_2",
      width: 48,
      height: 48,
    ),
  ),
  key_3(
    GYWIcon(
      name: "Key 3",
      filename: "key_3",
      width: 48,
      height: 48,
    ),
  ),
  key_4(
    GYWIcon(
      name: "Key 4",
      filename: "key_4",
      width: 48,
      height: 48,
    ),
  ),
  key_5(
    GYWIcon(
      name: "Key 5",
      filename: "key_5",
      width: 48,
      height: 48,
    ),
  ),
  key_6(
    GYWIcon(
      name: "Key 6",
      filename: "key_6",
      width: 48,
      height: 48,
    ),
  ),
  key_7(
    GYWIcon(
      name: "Key 7",
      filename: "key_7",
      width: 48,
      height: 48,
    ),
  ),
  key_8(
    GYWIcon(
      name: "Key 8",
      filename: "key_8",
      width: 48,
      height: 48,
    ),
  ),
  key_9(
    GYWIcon(
      name: "Key 9",
      filename: "key_9",
      width: 48,
      height: 48,
    ),
  ),
  key_A(
    GYWIcon(
      name: "Key A",
      filename: "key_A",
      width: 48,
      height: 48,
    ),
  ),
  key_B(
    GYWIcon(
      name: "Key B",
      filename: "key_B",
      width: 48,
      height: 48,
    ),
  ),
  key_C(
    GYWIcon(
      name: "Key C",
      filename: "key_C",
      width: 48,
      height: 48,
    ),
  ),
  key_D(
    GYWIcon(
      name: "Key D",
      filename: "key_D",
      width: 48,
      height: 48,
    ),
  ),
  key_star(
    GYWIcon(
      name: "Key *",
      filename: "key_star",
      width: 48,
      height: 48,
    ),
  ),
  key_num(
    GYWIcon(
      name: "Key #",
      filename: "key_#",
      width: 48,
      height: 48,
    ),
  );

  final GYWIcon icon;

  const GYWIcons(this.icon);
}
