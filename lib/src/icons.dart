import "package:flutter/foundation.dart";

/// A icon element that can be used on aRdent smart glasses.
@immutable
class GYWIcon {
  /// The name of the icon
  final String name;

  /// The filename on the GYW device
  final String filename;

  /// The width (in pixels) of the icon
  final double width;

  /// The height (in pixels) of the icon
  final double height;

  /// The path of the associated PNG file in the assets folder
  final String pathPng;

  /// The path of the associated SVG file in the assets folder
  final String pathSvg;

  /// Creates an icon.
  const GYWIcon({
    required this.name,
    required this.filename,
    required this.width,
    required this.height,
    this.pathPng = "assets/icons/unknown.png",
    this.pathSvg = "assets/icons/unknown.svg",
  });

  const GYWIcon._library({
    required this.name,
    required this.filename,
    required this.width,
    required this.height,
  })  : pathPng = "assets/icons/$filename.png",
        pathSvg = "assets/icons/$filename.svg";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GYWIcon &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          filename == other.filename &&
          width == other.width &&
          height == other.height &&
          pathPng == other.pathPng &&
          pathSvg == other.pathSvg;

  @override
  int get hashCode => Object.hash(
        name,
        filename,
        width,
        height,
        pathPng,
        pathSvg,
      );
}

/// The [GYWIcon] icons supported by default on aRdent smart glasses.
enum GYWIcons {
  /// Build icon
  build(
    GYWIcon._library(
      name: "Build",
      filename: "build",
      width: 48,
      height: 48,
    ),
  ),

  /// Camera icon
  camera(
    GYWIcon._library(
      name: "Camera",
      filename: "camera",
      width: 48,
      height: 48,
    ),
  ),

  /// Chat icon
  chat(
    GYWIcon._library(
      name: "Chat",
      filename: "chat",
      width: 48,
      height: 48,
    ),
  ),

  /// Filled checkbox icon
  checkbox(
    GYWIcon._library(
      name: "Checkbox checked",
      filename: "check",
      width: 48,
      height: 48,
    ),
  ),

  /// Empty checkbox icon
  checkboxEmpty(
    GYWIcon._library(
      name: "Checkbox empty",
      filename: "uncheck",
      width: 48,
      height: 48,
    ),
  ),

  /// Cloud with backup icon
  cloud_backup(
    GYWIcon._library(
      name: "Cloud backup",
      filename: "cloud_backup",
      width: 48,
      height: 48,
    ),
  ),

  /// Cloud with check icon
  cloud_done(
    GYWIcon._library(
      name: "Cloud done",
      filename: "cloud_done",
      width: 48,
      height: 48,
    ),
  ),

  /// Done icon
  done(
    GYWIcon._library(
      name: "Done",
      filename: "done",
      width: 48,
      height: 48,
    ),
  ),

  /// Arrow down icon
  down(
    GYWIcon._library(
      name: "Down",
      filename: "down",
      width: 48,
      height: 48,
    ),
  ),

  /// Edit icon
  edit(
    GYWIcon._library(
      name: "Edit",
      filename: "edit",
      width: 48,
      height: 48,
    ),
  ),

  /// File icon
  file(
    GYWIcon._library(
      name: "File",
      filename: "file",
      width: 48,
      height: 48,
    ),
  ),

  /// Folder icon
  folder(
    GYWIcon._library(
      name: "Folder",
      filename: "folder",
      width: 48,
      height: 48,
    ),
  ),

  /// Get Your Way logo
  gyw(
    GYWIcon._library(
      name: "GYW",
      filename: "GYW",
      width: 121,
      height: 48,
    ),
  ),

  /// Help icon
  help(
    GYWIcon._library(
      name: "Help",
      filename: "help",
      width: 48,
      height: 48,
    ),
  ),

  /// Info icon
  info(
    GYWIcon._library(
      name: "Information",
      filename: "info",
      width: 48,
      height: 48,
    ),
  ),

  /// Arrow left icon
  left(
    GYWIcon._library(
      name: "Left",
      filename: "left",
      width: 48,
      height: 48,
    ),
  ),

  /// Location pin icon
  location(
    GYWIcon._library(
      name: "Location",
      filename: "location",
      width: 48,
      height: 48,
    ),
  ),

  /// Next icon
  next(
    GYWIcon._library(
      name: "Next",
      filename: "next",
      width: 48,
      height: 48,
    ),
  ),

  /// NFC icon
  nfc(
    GYWIcon._library(
      name: "NFC",
      filename: "nfc",
      width: 48,
      height: 48,
    ),
  ),

  /// User icon
  person(
    GYWIcon._library(
      name: "Person",
      filename: "person",
      width: 48,
      height: 48,
    ),
  ),

  /// Previous icon
  previous(
    GYWIcon._library(
      name: "Previous",
      filename: "prev",
      width: 48,
      height: 48,
    ),
  ),

  /// Rename icon
  rename(
    GYWIcon._library(
      name: "Rename",
      filename: "rename",
      width: 48,
      height: 48,
    ),
  ),

  /// Arrow right icon
  right(
    GYWIcon._library(
      name: "Right",
      filename: "right",
      width: 48,
      height: 48,
    ),
  ),

  /// Settings icon
  settings(
    GYWIcon._library(
      name: "Settings",
      filename: "settings",
      width: 48,
      height: 48,
    ),
  ),

  /// Unknown icon
  unknown(
    GYWIcon._library(
      name: "Unknown",
      filename: "unknown",
      width: 48,
      height: 48,
    ),
  ),

  /// Arrow up icon
  up(
    GYWIcon._library(
      name: "Up",
      filename: "up",
      width: 48,
      height: 48,
    ),
  ),

  /// Warning icon
  warning(
    GYWIcon._library(
      name: "Warning",
      filename: "warning",
      width: 48,
      height: 48,
    ),
  ),

  /// Wifi icon
  wifi(
    GYWIcon._library(
      name: "Wi-Fi",
      filename: "wifi",
      width: 48,
      height: 48,
    ),
  ),

  /// Crossed off wifi icon
  wifi_off(
    GYWIcon._library(
      name: "Wi-Fi off",
      filename: "wifi_off",
      width: 48,
      height: 48,
    ),
  ),

  /// '0' keypad key icon
  key_0(
    GYWIcon._library(
      name: "Key 0",
      filename: "key_0",
      width: 48,
      height: 48,
    ),
  ),

  /// '1' keypad key icon
  key_1(
    GYWIcon._library(
      name: "Key 1",
      filename: "key_1",
      width: 48,
      height: 48,
    ),
  ),

  /// '2' keypad key icon
  key_2(
    GYWIcon._library(
      name: "Key 2",
      filename: "key_2",
      width: 48,
      height: 48,
    ),
  ),

  /// '3' keypad key icon
  key_3(
    GYWIcon._library(
      name: "Key 3",
      filename: "key_3",
      width: 48,
      height: 48,
    ),
  ),

  /// '4' keypad key icon
  key_4(
    GYWIcon._library(
      name: "Key 4",
      filename: "key_4",
      width: 48,
      height: 48,
    ),
  ),

  /// '5' keypad key icon
  key_5(
    GYWIcon._library(
      name: "Key 5",
      filename: "key_5",
      width: 48,
      height: 48,
    ),
  ),

  /// '6' keypad key icon
  key_6(
    GYWIcon._library(
      name: "Key 6",
      filename: "key_6",
      width: 48,
      height: 48,
    ),
  ),

  /// '7' keypad key icon
  key_7(
    GYWIcon._library(
      name: "Key 7",
      filename: "key_7",
      width: 48,
      height: 48,
    ),
  ),

  /// '8' keypad key icon
  key_8(
    GYWIcon._library(
      name: "Key 8",
      filename: "key_8",
      width: 48,
      height: 48,
    ),
  ),

  /// '9' keypad key icon
  key_9(
    GYWIcon._library(
      name: "Key 9",
      filename: "key_9",
      width: 48,
      height: 48,
    ),
  ),

  /// 'A' keypad key icon
  key_A(
    GYWIcon._library(
      name: "Key A",
      filename: "key_A",
      width: 48,
      height: 48,
    ),
  ),

  /// 'B' keypad key icon
  key_B(
    GYWIcon._library(
      name: "Key B",
      filename: "key_B",
      width: 48,
      height: 48,
    ),
  ),

  /// 'C' keypad key icon
  key_C(
    GYWIcon._library(
      name: "Key C",
      filename: "key_C",
      width: 48,
      height: 48,
    ),
  ),

  /// 'D' keypad key icon
  key_D(
    GYWIcon._library(
      name: "Key D",
      filename: "key_D",
      width: 48,
      height: 48,
    ),
  ),

  /// '*' keypad key icon
  key_star(
    GYWIcon._library(
      name: "Key *",
      filename: "key_star",
      width: 48,
      height: 48,
    ),
  ),

  /// '#' keypad key icon
  key_num(
    GYWIcon._library(
      name: "Key #",
      filename: "key_#",
      width: 48,
      height: 48,
    ),
  );

  /// The [GYWIcon] object to use to communicate with aRdent.
  final GYWIcon icon;

  const GYWIcons(this.icon);
}
