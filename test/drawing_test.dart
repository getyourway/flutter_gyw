import 'dart:io';

import 'package:flutter_gyw/flutter_gyw.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("JSON", () {
    test('white screen', () {
      const GYWDrawing drawing = WhiteScreen();

      expect(GYWDrawing.fromJson(drawing.toJson()), drawing);
    });

    test('Text', () {
      const GYWDrawing drawing = TextDrawing(text: "Text");

      expect(GYWDrawing.fromJson(drawing.toJson()), drawing);
    });

    test('Text with position', () {
      const GYWDrawing drawing = TextDrawing(
        text: "Text with position",
        left: 100,
        top: 200,
      );

      expect(GYWDrawing.fromJson(drawing.toJson()), drawing);
    });

    test('Text with font', () {
      const GYWFont font = GYWFonts.medium;

      const GYWDrawing drawing = TextDrawing(
        text: "Text with font",
        font: font,
      );

      expect(GYWDrawing.fromJson(drawing.toJson()), drawing);
    });

    test('Text with font and position', () {
      const font = GYWFonts.medium;

      const GYWDrawing drawing = TextDrawing(
        text: "Text with font and position",
        left: 150,
        top: 250,
        font: font,
      );

      expect(GYWDrawing.fromJson(drawing.toJson()), drawing);
    });

    test('Icon', () {
      const GYWIcon icon = GYWIcons.checkbox;

      const GYWDrawing drawing = IconDrawing(icon);

      expect(GYWDrawing.fromJson(drawing.toJson()), drawing);
    });

    test('Icon with position', () {
      const GYWIcon icon = GYWIcons.up;

      const GYWDrawing drawing = IconDrawing(
        icon,
        left: 120,
        top: 220,
      );

      expect(GYWDrawing.fromJson(drawing.toJson()), drawing);
    });

    test('Unsupported type', () {
      final json = {
        "type": "unsupported",
        "data": "Test",
      };

      expect(() => GYWDrawing.fromJson(json), throwsA(isA<UnsupportedError>()));
    });
  });

  group('Icon assets', () {
    test('All icons', () {
      final assetFolderPath = Platform.environment['UNIT_TEST_ASSETS'];

      for (final GYWIcon icon in GYWIcons.values) {
        expect(
          File("$assetFolderPath/${icon.path}").existsSync(),
          isTrue,
          reason: "File of $icon is missing",
        );
      }
    });
  });
}
