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
}

/// The icons supported by aRdent smart glasses
enum GYWIcons {
  blank(
    GYWIcon(
      name: "Blank",
      filename: "blank",
      width: 48,
      height: 48,
      pathPng: "assets/icons/blank.png",
      pathSvg: "assets/icons/blank.svg",
    ),
  ),
  build(
    GYWIcon(
      name: "Build",
      filename: "build",
      width: 48,
      height: 48,
      pathPng: "assets/icons/build.png",
      pathSvg: "assets/icons/build.svg",
    ),
  ),
  camera(
    GYWIcon(
      name: "Camera",
      filename: "camera",
      width: 48,
      height: 48,
      pathPng: "assets/icons/camera.png",
      pathSvg: "assets/icons/camera.svg",
    ),
  ),
  chat(
    GYWIcon(
      name: "Chat",
      filename: "chat",
      width: 48,
      height: 48,
      pathPng: "assets/icons/chat.png",
      pathSvg: "assets/icons/chat.svg",
    ),
  ),
  checkbox(
    GYWIcon(
      name: "Checkbox checked",
      filename: "check",
      width: 48,
      height: 48,
      pathPng: "assets/icons/check.png",
      pathSvg: "assets/icons/check.svg",
    ),
  ),
  checkboxEmpty(
    GYWIcon(
      name: "Checkbox empty",
      filename: "uncheck",
      width: 48,
      height: 48,
      pathPng: "assets/icons/uncheck.png",
      pathSvg: "assets/icons/uncheck.svg",
    ),
  ),
  cloud_backup(
    GYWIcon(
      name: "Cloud backup",
      filename: "cloud_backup",
      width: 48,
      height: 48,
      pathPng: "assets/icons/cloud_backup.png",
      pathSvg: "assets/icons/cloud_backup.svg",
    ),
  ),
  cloud_done(
    GYWIcon(
      name: "Cloud done",
      filename: "cloud_done",
      width: 48,
      height: 48,
      pathPng: "assets/icons/cloud_done.png",
      pathSvg: "assets/icons/cloud_done.svg",
    ),
  ),
  done(
    GYWIcon(
      name: "Done",
      filename: "done",
      width: 48,
      height: 48,
      pathPng: "assets/icons/done.png",
      pathSvg: "assets/icons/done.svg",
    ),
  ),
  down(
    GYWIcon(
      name: "Down",
      filename: "down",
      width: 48,
      height: 48,
      pathPng: "assets/icons/down.png",
      pathSvg: "assets/icons/down.svg",
    ),
  ),
  edit(
    GYWIcon(
      name: "Edit",
      filename: "edit",
      width: 48,
      height: 48,
      pathPng: "assets/icons/edit.png",
      pathSvg: "assets/icons/edit.svg",
    ),
  ),
  file(
    GYWIcon(
      name: "File",
      filename: "file",
      width: 48,
      height: 48,
      pathPng: "assets/icons/file.png",
      pathSvg: "assets/icons/file.svg",
    ),
  ),
  folder(
    GYWIcon(
      name: "Folder",
      filename: "folder",
      width: 48,
      height: 48,
      pathPng: "assets/icons/folder.png",
      pathSvg: "assets/icons/folder.svg",
    ),
  ),
  gyw(
    GYWIcon(
      name: "GYW",
      filename: "GYW",
      width: 121,
      height: 48,
      pathPng: "assets/icons/GYW.png",
      pathSvg: "assets/icons/GYW.svg",
    ),
  ),
  help(
    GYWIcon(
      name: "Help",
      filename: "help",
      width: 48,
      height: 48,
      pathPng: "assets/icons/help.png",
      pathSvg: "assets/icons/help.svg",
    ),
  ),
  info(
    GYWIcon(
      name: "Information",
      filename: "info",
      width: 48,
      height: 48,
      pathPng: "assets/icons/info.png",
      pathSvg: "assets/icons/info.svg",
    ),
  ),
  left(
    GYWIcon(
      name: "Left",
      filename: "left",
      width: 48,
      height: 48,
      pathPng: "assets/icons/left.png",
      pathSvg: "assets/icons/left.svg",
    ),
  ),
  location(
    GYWIcon(
      name: "Location",
      filename: "location",
      width: 48,
      height: 48,
      pathPng: "assets/icons/location.png",
      pathSvg: "assets/icons/location.svg",
    ),
  ),
  next(
    GYWIcon(
      name: "Next",
      filename: "next",
      width: 48,
      height: 48,
      pathPng: "assets/icons/next.png",
      pathSvg: "assets/icons/next.svg",
    ),
  ),
  nfc(
    GYWIcon(
      name: "NFC",
      filename: "nfc",
      width: 48,
      height: 48,
      pathPng: "assets/icons/nfc.png",
      pathSvg: "assets/icons/nfc.svg",
    ),
  ),
  person(
    GYWIcon(
      name: "Person",
      filename: "person",
      width: 48,
      height: 48,
      pathPng: "assets/icons/person.png",
      pathSvg: "assets/icons/person.svg",
    ),
  ),
  previous(
    GYWIcon(
      name: "Previous",
      filename: "prev",
      width: 48,
      height: 48,
      pathPng: "assets/icons/prev.png",
      pathSvg: "assets/icons/prev.svg",
    ),
  ),
  rename(
    GYWIcon(
      name: "Rename",
      filename: "rename",
      width: 48,
      height: 48,
      pathPng: "assets/icons/rename.png",
      pathSvg: "assets/icons/rename.svg",
    ),
  ),
  right(
    GYWIcon(
      name: "Right",
      filename: "right",
      width: 48,
      height: 48,
      pathPng: "assets/icons/right.png",
      pathSvg: "assets/icons/right.svg",
    ),
  ),
  settings(
    GYWIcon(
      name: "Settings",
      filename: "settings",
      width: 48,
      height: 48,
      pathPng: "assets/icons/settings.png",
      pathSvg: "assets/icons/settings.svg",
    ),
  ),
  up(
    GYWIcon(
      name: "Up",
      filename: "up",
      width: 48,
      height: 48,
      pathPng: "assets/icons/up.png",
      pathSvg: "assets/icons/up.svg",
    ),
  ),
  warning(
    GYWIcon(
      name: "Warning",
      filename: "warning",
      width: 48,
      height: 48,
      pathPng: "assets/icons/warning.png",
      pathSvg: "assets/icons/warning.svg",
    ),
  ),
  wifi(
    GYWIcon(
      name: "Wi-Fi",
      filename: "wifi",
      width: 48,
      height: 48,
      pathPng: "assets/icons/wifi.png",
      pathSvg: "assets/icons/wifi.svg",
    ),
  ),
  wifi_off(
    GYWIcon(
      name: "Wi-Fi off",
      filename: "wifi_off",
      width: 48,
      height: 48,
      pathPng: "assets/icons/wifi_off.png",
      pathSvg: "assets/icons/wifi_off.svg",
    ),
  ),
  key_0(
    GYWIcon(
      name: "Key 0",
      filename: "key_0",
      width: 48,
      height: 48,
      pathPng: "assets/icons/key_0.png",
      pathSvg: "assets/icons/key_0.svg",
    ),
  ),
  key_1(
    GYWIcon(
      name: "Key 1",
      filename: "key_1",
      width: 48,
      height: 48,
      pathPng: "assets/icons/key_1.png",
      pathSvg: "assets/icons/key_1.svg",
    ),
  ),
  key_2(
    GYWIcon(
      name: "Key 2",
      filename: "key_2",
      width: 48,
      height: 48,
      pathPng: "assets/icons/key_2.png",
      pathSvg: "assets/icons/key_2.svg",
    ),
  ),
  key_3(
    GYWIcon(
      name: "Key 3",
      filename: "key_3",
      width: 48,
      height: 48,
      pathPng: "assets/icons/key_3.png",
      pathSvg: "assets/icons/key_3.svg",
    ),
  ),
  key_4(
    GYWIcon(
      name: "Key 4",
      filename: "key_4",
      width: 48,
      height: 48,
      pathPng: "assets/icons/key_4.png",
      pathSvg: "assets/icons/key_4.svg",
    ),
  ),
  key_5(
    GYWIcon(
      name: "Key 5",
      filename: "key_5",
      width: 48,
      height: 48,
      pathPng: "assets/icons/key_5.png",
      pathSvg: "assets/icons/key_5.svg",
    ),
  ),
  key_6(
    GYWIcon(
      name: "Key 6",
      filename: "key_6",
      width: 48,
      height: 48,
      pathPng: "assets/icons/key_6.png",
      pathSvg: "assets/icons/key_6.svg",
    ),
  ),
  key_7(
    GYWIcon(
      name: "Key 7",
      filename: "key_7",
      width: 48,
      height: 48,
      pathPng: "assets/icons/key_7.png",
      pathSvg: "assets/icons/key_7.svg",
    ),
  ),
  key_8(
    GYWIcon(
      name: "Key 8",
      filename: "key_8",
      width: 48,
      height: 48,
      pathPng: "assets/icons/key_8.png",
      pathSvg: "assets/icons/key_8.svg",
    ),
  ),
  key_9(
    GYWIcon(
      name: "Key 9",
      filename: "key_9",
      width: 48,
      height: 48,
      pathPng: "assets/icons/key_9.png",
      pathSvg: "assets/icons/key_9.svg",
    ),
  ),
  key_A(
    GYWIcon(
      name: "Key A",
      filename: "key_A",
      width: 48,
      height: 48,
      pathPng: "assets/icons/key_A.png",
      pathSvg: "assets/icons/key_A.svg",
    ),
  ),
  key_B(
    GYWIcon(
      name: "Key B",
      filename: "key_B",
      width: 48,
      height: 48,
      pathPng: "assets/icons/key_B.png",
      pathSvg: "assets/icons/key_B.svg",
    ),
  ),
  key_C(
    GYWIcon(
      name: "Key C",
      filename: "key_C",
      width: 48,
      height: 48,
      pathPng: "assets/icons/key_C.png",
      pathSvg: "assets/icons/key_C.svg",
    ),
  ),
  key_D(
    GYWIcon(
      name: "Key D",
      filename: "key_D",
      width: 48,
      height: 48,
      pathPng: "assets/icons/key_D.png",
      pathSvg: "assets/icons/key_D.svg",
    ),
  ),
  key_star(
    GYWIcon(
      name: "Key *",
      filename: "key_star",
      width: 48,
      height: 48,
      pathPng: "assets/icons/key_star.png",
      pathSvg: "assets/icons/key_star.svg",
    ),
  ),
  key_num(
    GYWIcon(
      name: "Key #",
      filename: "key_#",
      width: 48,
      height: 48,
      pathPng: "assets/icons/key_#.png",
      pathSvg: "assets/icons/key_#.svg",
    ),
  );

  final GYWIcon icon;

  const GYWIcons(this.icon);
}
