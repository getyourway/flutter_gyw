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
  String get path => "assets/icons/$filename.jpg";

  /// Width (in pixel) of the icon
  double get width => 80.0;

  /// Height (in pixel) of the icon
  double get height => 80.0;
}

class GYWIcons {
  // Icons from IconAwesome
  static const GYWIcon arrowDown = GYWIcon(
    "arrowDown",
    "IconAwesomeArrowDown",
  );
  static const GYWIcon arrowLeft = GYWIcon(
    "arrowLeft",
    "IconAwesomeArrowLeft",
  );
  static const GYWIcon arrowRight = GYWIcon(
    "arrowRight",
    "IconAwesomeArrowRight",
  );
  static const GYWIcon arrowUp = GYWIcon(
    "arrowUp",
    "IconAwesomeArrowUp",
  );
  static const GYWIcon arrowAlt = GYWIcon(
    "arrowAlt",
    "IconAwesomeArrowAlt",
  );
  static const GYWIcon arrowExpandAlt = GYWIcon(
    "arrowExpandAlt",
    "IconAwesomeExpandArrowAlt",
  );
  static const GYWIcon arrowLocation = GYWIcon(
    "arrowLocation",
    "IconAwesomeLocationArrow",
  );
  static const GYWIcon batteryFull = GYWIcon(
    "batteryFull",
    "IconAwesomeBatteryFull",
  );
  static const GYWIcon batteryHalf = GYWIcon(
    "batteryHalf",
    "IconAwesomeBatteryHalf",
  );
  static const GYWIcon batteryQuarter = GYWIcon(
    "batteryQuarter",
    "IconAwesomeBatteryQuarter",
  );
  static const GYWIcon batteryEmpty = GYWIcon(
    "batteryEmpty",
    "IconAwesomeBatteryEmpty",
  );
  static const GYWIcon dropbox = GYWIcon(
    "dropbox",
    "IconAwesomeDropbox",
  );
  static const GYWIcon flag = GYWIcon(
    "flag",
    "IconAwesomeFlag",
  );
  static const GYWIcon flagCheckered = GYWIcon(
    "flagCheckered",
    "IconAwesomeFlagCheckered",
  );

  // Icons from IconFeather
  static const GYWIcon message = GYWIcon(
    "message",
    "IconFeatherMessageCircle",
  );

  // Icons from IconIonicIos
  static const GYWIcon speed = GYWIcon(
    "speed",
    "IconIonicIosSpeedometer",
  );
  static const GYWIcon send = GYWIcon(
    "send",
    "IconIonicIosSend",
  );
  static const GYWIcon notification = GYWIcon(
    "notification",
    "IconIonicIosNotifications",
  );
  static const GYWIcon information = GYWIcon(
    "information",
    "IconIonicIosInformationCircle",
  );
  static const GYWIcon checkbox = GYWIcon(
    "checkbox",
    "IconIonicIosCheckbox",
  );

  // Icons from IconMap
  static const GYWIcon food = GYWIcon(
    "food",
    "IconMapFood",
  );

  // Icons from IconMaterial
  static const GYWIcon mailbox = GYWIcon(
    "mailbox",
    "IconMaterialMarkunreadMailbox",
  );
  static const GYWIcon arrowUpLeft = GYWIcon(
    "arrowUpLeft",
    "IconMaterialSubdirectoryArrowLeft",
  );
  static const GYWIcon arrowUpRight = GYWIcon(
    "arrowUpRight",
    "IconMaterialSubdirectoryArrowRight",
  );
  static const GYWIcon arrowDownLeft = GYWIcon(
    "arrowDownLeft",
    "IconMaterialSubdirectoryArrowLeft1",
  );
  static const GYWIcon arrowDownRight = GYWIcon(
    "arrowDownRight",
    "IconMaterialSubdirectoryArrowRight1",
  );

  // Icons from IconMetro
  static const GYWIcon fire = GYWIcon(
    "fire",
    "IconMetroFire",
  );
}
