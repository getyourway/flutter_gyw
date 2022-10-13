enum GYWFont {
  basic,
  title,
  bigBasic,
  bigTitle,
}

extension FontSize on GYWFont {

  /// Index value transmitted to the device
  int get index {
    switch (this) {
      case GYWFont.basic:
        return 0;
      case GYWFont.title:
        return 1;
      case GYWFont.bigBasic:
        return 2;
      case GYWFont.bigTitle:
        return 3;
    }
  }

  /// Width (in pixels) of a character
  int get width {
    switch (this) {
      case GYWFont.basic:
        return 14;
      case GYWFont.title:
        return 18;
      case GYWFont.bigBasic:
        return 30;
      case GYWFont.bigTitle:
        return 50;
    }
  }

  /// Height (in pixels) of a character
  int get height {
    switch (this) {
      case GYWFont.basic:
        return 14;
      case GYWFont.title:
        return 18;
      case GYWFont.bigBasic:
        return 60;
      case GYWFont.bigTitle:
        return 90;
    }
  }
}
