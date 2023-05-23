import 'dart:convert';
import 'dart:typed_data';

import 'commands.dart';
import 'fonts.dart';
import 'helpers.dart';
import 'icons.dart';

/// A drawing that can be displayed on a pair of aRdent smart glasses
abstract class GYWDrawing {
  /// Distance (in pixels) from the top
  final int top;

  /// Distance (in pixels) from the left side
  final int left;

  const GYWDrawing({
    this.top = 0,
    this.left = 0,
  });

  /// Convert the drawing into a list of commands understood by the device
  List<GYWBtCommand> toCommands();

  /// Deserializes a [GYWDrawing] from JSON data
  factory GYWDrawing.fromJson(Map<String, dynamic> data) {
    switch (data["type"]) {
      case TextDrawing.type:
        return TextDrawing.fromJson(data);
      case WhiteScreen.type:
        return WhiteScreen.fromJson(data);
      case IconDrawing.type:
        return IconDrawing.fromJson(data);
      default:
        throw UnsupportedError("Type '${data['type']}' is not supported.");
    }
  }

  /// Serializes a drawing to JSON data
  Map<String, dynamic> toJson();
}

/// A drawing to display text on an aRdent device
class TextDrawing extends GYWDrawing {
  /// Type of a [TextDrawing] drawing
  static const String type = "text";

  /// Displayed text
  final String text;

  /// Font (fontSize, fontWeight, ...) of the text
  /// If no font is given, it uses the most recent one
  final GYWFont? font;

  /// size of the text (max 48 pt)
  final int? size;

  /// color of the text (in 8-characters ORGB format)
  final String? color;

  const TextDrawing({
    required this.text,
    this.font,
    this.size,
    this.color,
    super.left = 0,
    super.top = 0,
  });

  @override
  List<GYWBtCommand> toCommands() {
    // Bytes generation for the control data (command code + params)
    final controlBytes = BytesBuilder();

    controlBytes.add(int8Bytes(GYWControlCode.displayText.value));
    controlBytes.add(int32Bytes(left));
    controlBytes.add(int32Bytes(top));

    // Add font
    if (font != null) {
      controlBytes.add(utf8.encode(font!.prefix));
    }

    return [
      GYWBtCommand(
        GYWCharacteristic.nameDisplay,
        const Utf8Encoder().convert(text),
      ),
      GYWBtCommand(
        GYWCharacteristic.ctrlDisplay,
        controlBytes.toBytes(),
      ),
    ];
  }

  @override
  String toString() {
    return "Drawing: Text $text at ($left, $top)";
  }

  @override
  bool operator ==(Object other) {
    if (other is TextDrawing) {
      return text == other.text &&
          left == other.left &&
          top == other.top &&
          font == other.font &&
          size == other.size &&
          color == other.color;
    } else {
      return false;
    }
  }

  @override
  int get hashCode =>
      37 * text.hashCode +
      23 * font.hashCode +
      51 * left.hashCode +
      13 * top.hashCode +
      19 * size.hashCode +
      41 * color.hashCode;

  /// Deserialize a [TextDrawing] from JSON data
  factory TextDrawing.fromJson(Map<String, dynamic> data) {
    GYWFont? font;
    try {
      font = GYWFont.values.firstWhere(
        (e) => e.index == data["font"] || e.name == data["font"],
      );
    } on StateError {
      font = null;
    }

    return TextDrawing(
      left: data["left"] as int,
      top: data["top"] as int,
      // Deprecated: "text" key will be deprecated in future version
      text: data["data"] as String? ?? data["text"] as String,
      font: font,
      size: data["size"] as int?,
      color: data["color"] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "left": left,
      "top": top,
      "data": text,
      // Deprecated: "text" key will be deprecated in future version
      "text": text,
      if (font != null) "font": font!.index,
      "size": size,
      "color": color,
    };
  }
}

/// A drawing to reset the screen of the aRdent device to a white screen
class WhiteScreen extends GYWDrawing {
  /// Type of the [WhiteScreen] drawing
  static const String type = "white_screen";

  const WhiteScreen();

  @override
  List<GYWBtCommand> toCommands() {
    return [
      GYWBtCommand(
        GYWCharacteristic.ctrlDisplay,
        int8Bytes(GYWControlCode.clear.value),
      )
    ];
  }

  @override
  String toString() {
    return "Drawing: white screen";
  }

  /// Deserialize a [WhiteScreen] from JSON data
  // ignore: avoid_unused_constructor_parameters
  factory WhiteScreen.fromJson(Map<String, dynamic> data) {
    return const WhiteScreen();
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type,
    };
  }
}

/// A drawing to display an icon on an aRdent device
class IconDrawing extends GYWDrawing {
  /// Type of the [IconDrawing]
  static const String type = "icon";

  /// The displayed icon
  final GYWIcon icon;

  /// Hexadecimal code of the icon fill color
  final String? color;

  const IconDrawing(
    this.icon, {
    super.top,
    super.left,
    this.color,
  });

  @override
  List<GYWBtCommand> toCommands() {
    final controlBytes = BytesBuilder();
    controlBytes.add(int8Bytes(GYWControlCode.displayImage.value));
    controlBytes.add(int32Bytes(left));
    controlBytes.add(int32Bytes(top));

    if (color != null) {
      // Add color value
      controlBytes.add(utf8.encode(color!));
    }

    return <GYWBtCommand>[
      GYWBtCommand(
        GYWCharacteristic.nameDisplay,
        const Utf8Encoder().convert("${icon.filename}.bin"),
      ),
      GYWBtCommand(
        GYWCharacteristic.ctrlDisplay,
        controlBytes.toBytes(),
      )
    ];
  }

  @override
  String toString() {
    return "Drawing: ${icon.name} at ($left, $top)";
  }

  @override
  bool operator ==(Object other) {
    if (other is IconDrawing) {
      return icon == other.icon &&
          color == other.color &&
          left == other.left &&
          top == other.top;
    } else {
      return false;
    }
  }

  @override
  int get hashCode =>
      29 * icon.hashCode +
      57 * left.hashCode +
      17 * top.hashCode +
      23 * color.hashCode;

  /// Deserialize an [IconDrawing] from JSON data
  factory IconDrawing.fromJson(Map<String, dynamic> data) {
    // Deprecated "icon" key will be deprecated in future versions
    final String icon = data["data"] as String? ?? data["icon"] as String;

    return IconDrawing(
      GYWIcon.values.firstWhere(
        (element) => element.filename == icon || element.name == icon,
      ),
      left: data["left"] as int,
      top: data["top"] as int,
      color: data["color"] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "left": left,
      "top": top,
      // Deprecated: "icon" key will be deprecated in future versions
      "icon": icon.name,
      "data": icon.filename,
      "color": color,
    };
  }
}
