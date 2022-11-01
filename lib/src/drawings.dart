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
}

/// A drawing to display text on an aRdent device
class TextDrawing extends Drawing {
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
}

/// A drawing to reset the screen of the aRdent device to a white screen
class WhiteScreen extends Drawing {
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
}

/// A drawing to display an icon on an aRdent device
class IconDrawing extends Drawing {
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
}
