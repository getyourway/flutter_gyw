import "package:flutter/material.dart";

/// A icon element that can be used on aRdent smart glasses.
@immutable
class GYWIcon {
  /// The name of the icon
  final String name;

  /// The filename on the GYW device
  final String filename;

  /// The size (in pixels) of the icon
  final Size size;

  /// The path of the associated PNG file in the assets folder
  final String pathPng;

  /// The path of the associated SVG file in the assets folder
  final String pathSvg;

  /// Creates an icon.
  const GYWIcon({
    required this.name,
    required this.filename,
    this.size = const Size(48, 48),
    this.pathPng = "assets/icons/unknown.png",
    this.pathSvg = "assets/icons/unknown.svg",
  });

  const GYWIcon._library({
    required this.name,
    required this.filename,
    this.size = const Size(48, 48),
  })  : pathPng = "assets/icons/$filename.png",
        pathSvg = "assets/icons/$filename.svg";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GYWIcon &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          filename == other.filename &&
          size == other.size &&
          pathPng == other.pathPng &&
          pathSvg == other.pathSvg;

  @override
  int get hashCode => Object.hash(
        name,
        filename,
        size,
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
    ),
  ),

  /// Camera icon
  camera(
    GYWIcon._library(
      name: "Camera",
      filename: "camera",
    ),
  ),

  /// Chat icon
  chat(
    GYWIcon._library(
      name: "Chat",
      filename: "chat",
    ),
  ),

  /// Filled checkbox icon
  checkbox(
    GYWIcon._library(
      name: "Checkbox checked",
      filename: "check",
    ),
  ),

  /// Empty checkbox icon
  checkboxEmpty(
    GYWIcon._library(
      name: "Checkbox empty",
      filename: "uncheck",
    ),
  ),

  /// Cloud with backup icon
  cloud_backup(
    GYWIcon._library(
      name: "Cloud backup",
      filename: "cloud_backup",
    ),
  ),

  /// Cloud with check icon
  cloud_done(
    GYWIcon._library(
      name: "Cloud done",
      filename: "cloud_done",
    ),
  ),

  /// Done icon
  done(
    GYWIcon._library(
      name: "Done",
      filename: "done",
    ),
  ),

  /// Arrow down icon
  down(
    GYWIcon._library(
      name: "Down",
      filename: "down",
    ),
  ),

  /// Edit icon
  edit(
    GYWIcon._library(
      name: "Edit",
      filename: "edit",
    ),
  ),

  /// File icon
  file(
    GYWIcon._library(
      name: "File",
      filename: "file",
    ),
  ),

  /// Folder icon
  folder(
    GYWIcon._library(
      name: "Folder",
      filename: "folder",
    ),
  ),

  /// Get Your Way logo
  gyw(
    GYWIcon._library(
      name: "GYW",
      filename: "GYW",
      size: Size(121, 48),
    ),
  ),

  /// Help icon
  help(
    GYWIcon._library(
      name: "Help",
      filename: "help",
    ),
  ),

  /// Info icon
  info(
    GYWIcon._library(
      name: "Information",
      filename: "info",
    ),
  ),

  /// Arrow left icon
  left(
    GYWIcon._library(
      name: "Left",
      filename: "left",
    ),
  ),

  /// Location pin icon
  location(
    GYWIcon._library(
      name: "Location",
      filename: "location",
    ),
  ),

  /// Next icon
  next(
    GYWIcon._library(
      name: "Next",
      filename: "next",
    ),
  ),

  /// NFC icon
  nfc(
    GYWIcon._library(
      name: "NFC",
      filename: "nfc",
    ),
  ),

  /// User icon
  person(
    GYWIcon._library(
      name: "Person",
      filename: "person",
    ),
  ),

  /// Previous icon
  previous(
    GYWIcon._library(
      name: "Previous",
      filename: "prev",
    ),
  ),

  /// Rename icon
  rename(
    GYWIcon._library(
      name: "Rename",
      filename: "rename",
    ),
  ),

  /// Arrow right icon
  right(
    GYWIcon._library(
      name: "Right",
      filename: "right",
    ),
  ),

  /// Settings icon
  settings(
    GYWIcon._library(
      name: "Settings",
      filename: "settings",
    ),
  ),

  /// Unknown icon
  unknown(
    GYWIcon._library(
      name: "Unknown",
      filename: "help",
    ),
  ),

  /// Arrow up icon
  up(
    GYWIcon._library(
      name: "Up",
      filename: "up",
    ),
  ),

  /// Warning icon
  warning(
    GYWIcon._library(
      name: "Warning",
      filename: "warning",
    ),
  ),

  /// Wifi icon
  wifi(
    GYWIcon._library(
      name: "Wi-Fi",
      filename: "wifi",
    ),
  ),

  /// Crossed off wifi icon
  wifi_off(
    GYWIcon._library(
      name: "Wi-Fi off",
      filename: "wifi_off",
    ),
  ),

  /// '0' keypad key icon
  key_0(
    GYWIcon._library(
      name: "Key 0",
      filename: "key_0",
    ),
  ),

  /// '1' keypad key icon
  key_1(
    GYWIcon._library(
      name: "Key 1",
      filename: "key_1",
    ),
  ),

  /// '2' keypad key icon
  key_2(
    GYWIcon._library(
      name: "Key 2",
      filename: "key_2",
    ),
  ),

  /// '3' keypad key icon
  key_3(
    GYWIcon._library(
      name: "Key 3",
      filename: "key_3",
    ),
  ),

  /// '4' keypad key icon
  key_4(
    GYWIcon._library(
      name: "Key 4",
      filename: "key_4",
    ),
  ),

  /// '5' keypad key icon
  key_5(
    GYWIcon._library(
      name: "Key 5",
      filename: "key_5",
    ),
  ),

  /// '6' keypad key icon
  key_6(
    GYWIcon._library(
      name: "Key 6",
      filename: "key_6",
    ),
  ),

  /// '7' keypad key icon
  key_7(
    GYWIcon._library(
      name: "Key 7",
      filename: "key_7",
    ),
  ),

  /// '8' keypad key icon
  key_8(
    GYWIcon._library(
      name: "Key 8",
      filename: "key_8",
    ),
  ),

  /// '9' keypad key icon
  key_9(
    GYWIcon._library(
      name: "Key 9",
      filename: "key_9",
    ),
  ),

  /// 'A' keypad key icon
  key_A(
    GYWIcon._library(
      name: "Key A",
      filename: "key_A",
    ),
  ),

  /// 'B' keypad key icon
  key_B(
    GYWIcon._library(
      name: "Key B",
      filename: "key_B",
    ),
  ),

  /// 'C' keypad key icon
  key_C(
    GYWIcon._library(
      name: "Key C",
      filename: "key_C",
    ),
  ),

  /// 'D' keypad key icon
  key_D(
    GYWIcon._library(
      name: "Key D",
      filename: "key_D",
    ),
  ),

  /// '*' keypad key icon
  key_star(
    GYWIcon._library(
      name: "Key *",
      filename: "key_star",
    ),
  ),

  /// '#' keypad key icon
  key_num(
    GYWIcon._library(
      name: "Key #",
      filename: "key_#",
    ),
  );

  /// The [GYWIcon] object to use to communicate with aRdent.
  final GYWIcon icon;

  const GYWIcons(this.icon);
}
