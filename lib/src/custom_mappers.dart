import "package:dart_mappable/dart_mappable.dart";
import "package:flutter_gyw/flutter_gyw.dart";

/// A custom mapper for [GYWIcon].
class GYWIconMapper extends SimpleMapper<GYWIcon> {
  /// Constructor.
  const GYWIconMapper();

  @override
  GYWIcon decode(dynamic value) {
    final String filename = value as String;

    final GYWIcon? icon = GYWIcons.values
        .cast<GYWIcons?>()
        .firstWhere(
          (element) => element!.icon.filename == filename,
          orElse: () => null,
        )
        ?.icon;

    return icon ?? GYWIcon(name: filename, filename: filename);
  }

  @override
  dynamic encode(GYWIcon self) {
    return self.filename;
  }
}

/// A custom mapper for [GYWFont].
class GYWFontMapper extends SimpleMapper<GYWFont> {
  /// Constructor.
  const GYWFontMapper();

  @override
  GYWFont decode(dynamic value) {
    final String filename = value as String;

    return GYWFonts.values
        .firstWhere(
          (element) => element.font.filename == filename,
          orElse: () => GYWFonts.robotoMono,
        )
        .font;
  }

  @override
  dynamic encode(GYWFont self) {
    return self.filename;
  }
}
