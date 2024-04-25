class GYWIcon {
  /// The name of the icon
  final String name;

  /// The filename on the GYW device
  final String filename;

  /// The width (in pixels) of the icon
  final double width;

  /// The height (in pixels) of the icon
  final double height;

  /// The path to the PNG file
  final String pathPng;

  /// The path to the SVG file
  final String pathSvg;

  const GYWIcon({
    required this.name,
    required this.filename,
    required this.width,
    required this.height,
    this.pathPng = "assets/icons/unknown.png",
    this.pathSvg = "assets/icons/unknown.png",
  });

  const GYWIcon._library({
    required this.name,
    required this.filename,
    required this.width,
    required this.height,
  })  : pathPng = "assets/icons/$filename.png",
        pathSvg = "assets/icons/$filename.svg";
}

/// The icons supported by aRdent smart glasses
enum GYWIcons {
  blank(
    GYWIcon._library(
      name: "Blank",
      filename: "blank",
      width: 48,
      height: 48,
    ),
  ),
  build(
    GYWIcon._library(
      name: "Build",
      filename: "build",
      width: 48,
      height: 48,
    ),
  ),
  camera(
    GYWIcon._library(
      name: "Camera",
      filename: "camera",
      width: 48,
      height: 48,
    ),
  ),
  chat(
    GYWIcon._library(
      name: "Chat",
      filename: "chat",
      width: 48,
      height: 48,
    ),
  ),
  checkbox(
    GYWIcon._library(
      name: "Checkbox checked",
      filename: "check",
      width: 48,
      height: 48,
    ),
  ),
  checkboxEmpty(
    GYWIcon._library(
      name: "Checkbox empty",
      filename: "uncheck",
      width: 48,
      height: 48,
    ),
  ),
  cloud_backup(
    GYWIcon._library(
      name: "Cloud backup",
      filename: "cloud_backup",
      width: 48,
      height: 48,
    ),
  ),
  cloud_done(
    GYWIcon._library(
      name: "Cloud done",
      filename: "cloud_done",
      width: 48,
      height: 48,
    ),
  ),
  done(
    GYWIcon._library(
      name: "Done",
      filename: "done",
      width: 48,
      height: 48,
    ),
  ),
  down(
    GYWIcon._library(
      name: "Down",
      filename: "down",
      width: 48,
      height: 48,
    ),
  ),
  edit(
    GYWIcon._library(
      name: "Edit",
      filename: "edit",
      width: 48,
      height: 48,
    ),
  ),
  file(
    GYWIcon._library(
      name: "File",
      filename: "file",
      width: 48,
      height: 48,
    ),
  ),
  folder(
    GYWIcon._library(
      name: "Folder",
      filename: "folder",
      width: 48,
      height: 48,
    ),
  ),
  gyw(
    GYWIcon._library(
      name: "GYW",
      filename: "GYW",
      width: 121,
      height: 48,
    ),
  ),
  help(
    GYWIcon._library(
      name: "Help",
      filename: "help",
      width: 48,
      height: 48,
    ),
  ),
  info(
    GYWIcon._library(
      name: "Information",
      filename: "info",
      width: 48,
      height: 48,
    ),
  ),
  left(
    GYWIcon._library(
      name: "Left",
      filename: "left",
      width: 48,
      height: 48,
    ),
  ),
  location(
    GYWIcon._library(
      name: "Location",
      filename: "location",
      width: 48,
      height: 48,
    ),
  ),
  next(
    GYWIcon._library(
      name: "Next",
      filename: "next",
      width: 48,
      height: 48,
    ),
  ),
  nfc(
    GYWIcon._library(
      name: "NFC",
      filename: "nfc",
      width: 48,
      height: 48,
    ),
  ),
  person(
    GYWIcon._library(
      name: "Person",
      filename: "person",
      width: 48,
      height: 48,
    ),
  ),
  previous(
    GYWIcon._library(
      name: "Previous",
      filename: "prev",
      width: 48,
      height: 48,
    ),
  ),
  rename(
    GYWIcon._library(
      name: "Rename",
      filename: "rename",
      width: 48,
      height: 48,
    ),
  ),
  right(
    GYWIcon._library(
      name: "Right",
      filename: "right",
      width: 48,
      height: 48,
    ),
  ),
  settings(
    GYWIcon._library(
      name: "Settings",
      filename: "settings",
      width: 48,
      height: 48,
    ),
  ),
  up(
    GYWIcon._library(
      name: "Up",
      filename: "up",
      width: 48,
      height: 48,
    ),
  ),
  warning(
    GYWIcon._library(
      name: "Warning",
      filename: "warning",
      width: 48,
      height: 48,
    ),
  ),
  wifi(
    GYWIcon._library(
      name: "Wi-Fi",
      filename: "wifi",
      width: 48,
      height: 48,
    ),
  ),
  wifi_off(
    GYWIcon._library(
      name: "Wi-Fi off",
      filename: "wifi_off",
      width: 48,
      height: 48,
    ),
  ),
  key_0(
    GYWIcon._library(
      name: "Key 0",
      filename: "key_0",
      width: 48,
      height: 48,
    ),
  ),
  key_1(
    GYWIcon._library(
      name: "Key 1",
      filename: "key_1",
      width: 48,
      height: 48,
    ),
  ),
  key_2(
    GYWIcon._library(
      name: "Key 2",
      filename: "key_2",
      width: 48,
      height: 48,
    ),
  ),
  key_3(
    GYWIcon._library(
      name: "Key 3",
      filename: "key_3",
      width: 48,
      height: 48,
    ),
  ),
  key_4(
    GYWIcon._library(
      name: "Key 4",
      filename: "key_4",
      width: 48,
      height: 48,
    ),
  ),
  key_5(
    GYWIcon._library(
      name: "Key 5",
      filename: "key_5",
      width: 48,
      height: 48,
    ),
  ),
  key_6(
    GYWIcon._library(
      name: "Key 6",
      filename: "key_6",
      width: 48,
      height: 48,
    ),
  ),
  key_7(
    GYWIcon._library(
      name: "Key 7",
      filename: "key_7",
      width: 48,
      height: 48,
    ),
  ),
  key_8(
    GYWIcon._library(
      name: "Key 8",
      filename: "key_8",
      width: 48,
      height: 48,
    ),
  ),
  key_9(
    GYWIcon._library(
      name: "Key 9",
      filename: "key_9",
      width: 48,
      height: 48,
    ),
  ),
  key_A(
    GYWIcon._library(
      name: "Key A",
      filename: "key_A",
      width: 48,
      height: 48,
    ),
  ),
  key_B(
    GYWIcon._library(
      name: "Key B",
      filename: "key_B",
      width: 48,
      height: 48,
    ),
  ),
  key_C(
    GYWIcon._library(
      name: "Key C",
      filename: "key_C",
      width: 48,
      height: 48,
    ),
  ),
  key_D(
    GYWIcon._library(
      name: "Key D",
      filename: "key_D",
      width: 48,
      height: 48,
    ),
  ),
  key_star(
    GYWIcon._library(
      name: "Key *",
      filename: "key_star",
      width: 48,
      height: 48,
    ),
  ),
  key_num(
    GYWIcon._library(
      name: "Key #",
      filename: "key_#",
      width: 48,
      height: 48,
    ),
  );

  final GYWIcon icon;

  const GYWIcons(this.icon);
}
