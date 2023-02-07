import 'dart:io';

import 'package:flutter_gyw/flutter_gyw.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group("Bluetooth JSON", () {
    test('white screen', () {
      Drawing drawing = const WhiteScreen();

      final bluetoothJson = drawing.toBluetoothJson();
      expect(bluetoothJson["type"], "white_screen");
    });

    test('Text', () {
      Drawing drawing = const TextDrawing(text: "Text");

      final bluetoothJson = drawing.toBluetoothJson();
      expect(bluetoothJson["type"], "text");
      expect(bluetoothJson["data"], "Text");
    });

    test('Text with position', () {
      Drawing drawing = const TextDrawing(
        text: "Text with position",
        left: 100,
        top: 200,
      );

      final bluetoothJson = drawing.toBluetoothJson();
      expect(bluetoothJson["type"], "text");
      expect(bluetoothJson["data"], "Text with position");
      expect(bluetoothJson["x_start"], 100);
      expect(bluetoothJson["y_start"], 200);
    });

    test('Text with font', () {
      const font = GYWFont("Test", "tst", 42);

      Drawing drawing = const TextDrawing(
        text: "Text with font",
        font: font,
      );

      final bluetoothJson = drawing.toBluetoothJson();
      expect(bluetoothJson["type"], "text");
      expect(bluetoothJson["data"], "Text with font");
      expect(bluetoothJson["title"], 42);
    });

    test('Text with font and position', () {
      const font = GYWFont("Test", "tst", 42);

      Drawing drawing = const TextDrawing(
        text: "Text with font and position",
        left: 150,
        top: 250,
        font: font,
      );

      final bluetoothJson = drawing.toBluetoothJson();
      expect(bluetoothJson["type"], "text");
      expect(bluetoothJson["data"], "Text with font and position");
      expect(bluetoothJson["x_start"], 150);
      expect(bluetoothJson["y_start"], 250);
      expect(bluetoothJson["title"], 42);
    });

    test('Icon', () {
      const icon = GYWIcon("Icon", "icon");

      Drawing drawing = const IconDrawing(icon);

      final bluetoothJson = drawing.toBluetoothJson();
      expect(bluetoothJson["type"], "memory");
      expect(bluetoothJson["data"], "icon");
    });

    test('Icon with position', () {
      const icon = GYWIcon("Icon with position", "icon_with_position");

      Drawing drawing = const IconDrawing(
        icon,
        left: 120,
        top: 220,
      );

      final bluetoothJson = drawing.toBluetoothJson();
      expect(bluetoothJson["type"], "memory");
      expect(bluetoothJson["data"], "icon_with_position");
      expect(bluetoothJson["x_start"], 120);
      expect(bluetoothJson["y_start"], 220);
    });
  }, skip: true); // Skip because depreacted

  group("JSON", () {
    test('white screen', () {
      Drawing drawing = const WhiteScreen();

      expect(Drawing.fromJson(drawing.toJson()), drawing);
    });

    test('Text', () {
      Drawing drawing = const TextDrawing(text: "Text");

      expect(Drawing.fromJson(drawing.toJson()), drawing);
    });

    test('Text with position', () {
      Drawing drawing = const TextDrawing(
        text: "Text with position",
        left: 100,
        top: 200,
      );

      expect(Drawing.fromJson(drawing.toJson()), drawing);
    });

    test('Text with font', () {
      const font = GYWFonts.bigBasic;

      Drawing drawing = const TextDrawing(
        text: "Text with font",
        font: font,
      );

      expect(Drawing.fromJson(drawing.toJson()), drawing);
    });

    test('Text with font and position', () {
      const font = GYWFonts.bigBasic;

      Drawing drawing = const TextDrawing(
        text: "Text with font and position",
        left: 150,
        top: 250,
        font: font,
      );

      expect(Drawing.fromJson(drawing.toJson()), drawing);
    });

    test('Icon', () {
      const icon = GYWIcons.arrowAlt;

      Drawing drawing = const IconDrawing(icon);

      expect(Drawing.fromJson(drawing.toJson()), drawing);
    });

    test('Icon with position', () {
      const icon = GYWIcons.arrowUp;

      Drawing drawing = const IconDrawing(
        icon,
        left: 120,
        top: 220,
      );

      expect(Drawing.fromJson(drawing.toJson()), drawing);
    });

    test('Unsupported type', () {
      final json = {
        "type": "unsupported",
        "data": "Test",
      };

      expect(() => Drawing.fromJson(json), throwsA(isA<UnsupportedError>()));
    });
  });

  group('Icon assets', () {
    test('All icons', () {
      final assetFolderPath = Platform.environment['UNIT_TEST_ASSETS'];
      for (GYWIcon icon in GYWIcons.values) {
        expect(
          File("$assetFolderPath/${icon.path}").existsSync(),
          isTrue,
          reason: "File of $icon is missing",
        );
      }
    });
  });
}
