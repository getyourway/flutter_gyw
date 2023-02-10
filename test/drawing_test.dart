import 'dart:io';

import 'package:flutter_gyw/flutter_gyw.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
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
      const font = GYWFonts.medium;

      Drawing drawing = const TextDrawing(
        text: "Text with font",
        font: font,
      );

      expect(Drawing.fromJson(drawing.toJson()), drawing);
    });

    test('Text with font and position', () {
      const font = GYWFonts.medium;

      Drawing drawing = const TextDrawing(
        text: "Text with font and position",
        left: 150,
        top: 250,
        font: font,
      );

      expect(Drawing.fromJson(drawing.toJson()), drawing);
    });

    test('Icon', () {
      const icon = GYWIcons.checkbox;

      Drawing drawing = const IconDrawing(icon);

      expect(Drawing.fromJson(drawing.toJson()), drawing);
    });

    test('Icon with position', () {
      const icon = GYWIcons.up;

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
