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
  String get path => "assets/icons/$filename.jpg";

  /// Width (in pixel) of the icon
  double get width => 80.0;

  /// Height (in pixel) of the icon
  double get height => 80.0;
}

/// Icons supported by aRdent devices
class GYWIcons {
  // Icons from IconAwesome
  static const GYWIcon arrowDown = GYWIcon(
    "down",
    "IconAwesomeArrowDown",
  );
  static const GYWIcon arrowLeft = GYWIcon(
    "left",
    "IconAwesomeArrowLeft",
  );
  static const GYWIcon arrowRight = GYWIcon(
    "right",
    "IconAwesomeArrowRight",
  );
  static const GYWIcon arrowUp = GYWIcon(
    "up",
    "IconAwesomeArrowUp",
  );
  static const GYWIcon arrowAlt = GYWIcon(
    "expIn",
    "IconAwesomeArrowsAlt",
  );
  static const GYWIcon arrowExpandAlt = GYWIcon(
    "expOut",
    "IconAwesomeExpandArrowsAlt",
  );
  static const GYWIcon arrowLocation = GYWIcon(
    "location",
    "IconAwesomeLocationArrow",
  );
  static const GYWIcon batteryFull = GYWIcon(
    "batt1",
    "IconAwesomeBatteryFull",
  );
  static const GYWIcon batteryHalf = GYWIcon(
    "batt12",
    "IconAwesomeBatteryHalf",
  );
  static const GYWIcon batteryQuarter = GYWIcon(
    "batt14",
    "IconAwesomeBatteryQuarter",
  );
  static const GYWIcon batteryEmpty = GYWIcon(
    "batt0",
    "IconAwesomeBatteryEmpty",
  );
  static const GYWIcon dropbox = GYWIcon(
    "dropbox",
    "IconAwesomeDropbox",
  );
  static const GYWIcon flag = GYWIcon(
    "flag0",
    "IconAwesomeFlag",
  );
  static const GYWIcon flagCheckered = GYWIcon(
    "flag1",
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
    "notif",
    "IconIonicIosNotifications",
  );
  static const GYWIcon information = GYWIcon(
    "info",
    "IconIonicIosInformationCircle",
  );

  // Icons from Google Icons
  static const GYWIcon checkbox = GYWIcon(
    "check",
    "GoogleIconsCheckbox",
  );
  static const GYWIcon checkboxEmpty = GYWIcon(
    "uncheck",
    "GoogleIconsCheckboxEmpty",
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
    "uLeft",
    "IconMaterialSubdirectoryArrowLeft",
  );
  static const GYWIcon arrowUpRight = GYWIcon(
    "uRight",
    "IconMaterialSubdirectoryArrowRight",
  );
  static const GYWIcon arrowDownLeft = GYWIcon(
    "dLeft",
    "IconMaterialSubdirectoryArrowLeft1",
  );
  static const GYWIcon arrowDownRight = GYWIcon(
    "dRight",
    "IconMaterialSubdirectoryArrowRight1",
  );

  // Icons from IconMetro
  static const GYWIcon fire = GYWIcon(
    "fire",
    "IconMetroFire",
  );

  /// List of all icons
  static const List<GYWIcon> values = [
    arrowDown,
    arrowLeft,
    arrowRight,
    arrowUp,
    arrowAlt,
    arrowExpandAlt,
    arrowLocation,
    batteryFull,
    batteryHalf,
    batteryQuarter,
    batteryEmpty,
    dropbox,
    flag,
    flagCheckered,
    message,
    speed,
    send,
    notification,
    information,
    checkbox,
    checkboxEmpty,
    food,
    mailbox,
    arrowUpLeft,
    arrowUpRight,
    arrowDownLeft,
    arrowDownRight,
    fire,
  ];
}
