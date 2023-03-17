import 'dart:io';

import 'package:flutter_gyw/flutter_gyw.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("JSON", () {
    test('white screen', () {
      const Drawing drawing = WhiteScreen();

      expect(Drawing.fromJson(drawing.toJson()), drawing);
    });

    test('Text', () {
      const Drawing drawing = TextDrawing(text: "Text");

      expect(Drawing.fromJson(drawing.toJson()), drawing);
    });

    test('Text with position', () {
      const Drawing drawing = TextDrawing(
        text: "Text with position",
        left: 100,
        top: 200,
      );

      expect(Drawing.fromJson(drawing.toJson()), drawing);
    });

    test('Text with font', () {
      const GYWFont font = GYWFonts.medium;

      const Drawing drawing = TextDrawing(
        text: "Text with font",
        font: font,
      );

      expect(Drawing.fromJson(drawing.toJson()), drawing);
    });

    test('Text with font and position', () {
      const font = GYWFonts.medium;

      const Drawing drawing = TextDrawing(
        text: "Text with font and position",
        left: 150,
        top: 250,
        font: font,
      );

      expect(Drawing.fromJson(drawing.toJson()), drawing);
    });

    test('Icon', () {
      const GYWIcon icon = GYWIcons.checkbox;

      const Drawing drawing = IconDrawing(icon);

      expect(Drawing.fromJson(drawing.toJson()), drawing);
    });

    test('Icon with position', () {
      const GYWIcon icon = GYWIcons.up;

      const Drawing drawing = IconDrawing(
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
