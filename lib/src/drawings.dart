import 'fonts.dart';
import 'icons.dart';

/// A drawing that represents data that can be displayed on an aRdent screen
abstract class Drawing {
  /// Distance (in pixels) from the top
  final int top;

  /// Distance (in pixels) from the left side
  final int left;

  const Drawing({
    this.top = 0,
    this.left = 0,
  });

  /// Convert the drawing into a JSON understood by the device
  Map<String, dynamic> toBluetoothJson();

  /// Deserializes a drawing from JSON data
  factory Drawing.fromJson(Map<String, dynamic> data) {
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
class TextDrawing extends Drawing {
  // Type of the drawing
  static const String type = "text";

  /// Displayed text
  final String text;

  /// Font (fontSize, fontWeight, ...) of the text
  final GYWFont font;

  const TextDrawing({
    required this.text,
    this.font = GYWFonts.basic,
    super.left = 0,
    super.top = 0,
  });

  @override
  Map<String, dynamic> toBluetoothJson() {
    return {
      "type": "text",
      "x_start": left,
      "y_start": top,
      "data": text,
      "x_size": 800,
      "title": font.index,
    };
  }

  @override
  String toString() {
    return "Drawing: Text $text at ($left, $top)";
  }

  /// Deserializes a text drawing from JSON data
  factory TextDrawing.fromJson(Map<String, dynamic> data) {
    return TextDrawing(
      left: data["left"],
      top: data["top"],
      text: data["text"],
      font: GYWFonts.values.firstWhere(
        (e) => e.name == data["font"],
        orElse: () => GYWFonts.basic,
      ),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "left": left,
      "top": top,
      "text": text,
      "font": font.name,
    };
  }
}

/// A drawing to reset the screen of the aRdent device to a white screen
class WhiteScreen extends Drawing {
  // Type of the white screen drawing
  static const String type = "white_screen";

  const WhiteScreen();

  @override
  Map<String, dynamic> toBluetoothJson() {
    return {
      "type": "white_screen",
    };
  }

  @override
  String toString() {
    return "Drawing: white screen";
  }

  /// Deserializes a white screen from JSON data
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
class IconDrawing extends Drawing {
  // Type of the icon drawing
  static const String type = "icon";

  /// The displayed icon
  final GYWIcon icon;

  const IconDrawing(
    this.icon, {
    super.top,
    super.left,
  });

  @override
  Map<String, dynamic> toBluetoothJson() {
    return {
      "type": "memory",
      "x_start": left,
      "y_start": top,
      "data": icon.filename,
      "x_size": icon.width,
      "y_size": icon.height,
    };
  }

  @override
  String toString() {
    return "Drawing: ${icon.name} at ($left, $top)";
  }

  /// Deserializes an icon drawing from JSON data
  factory IconDrawing.fromJson(Map<String, dynamic> data) {
    return IconDrawing(
      GYWIcons.values.firstWhere((element) => element.name == data["icon"]),
      left: data["left"],
      top: data["top"],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "left": left,
      "top": top,
      "icon": icon.name,
    };
  }
}
