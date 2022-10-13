import 'fonts.dart';
import 'icons.dart';

abstract class Drawing {
  final int top;
  final int left;

  const Drawing({
    this.top = 0,
    this.left = 0,
  });

  Map<String, dynamic> toBluetoothJson();
}

class TextDrawing extends Drawing {
  final String text;
  final GYWFont font;

  const TextDrawing({
    required this.text,
    this.font = GYWFont.basic,
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

class IconDrawing extends Drawing {
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
