import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gyw/flutter_gyw.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("JSON", () {
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
      const GYWFont font = GYWFont.medium;

      const GYWDrawing drawing = TextDrawing(
        text: "Text with font",
        font: font,
      );

      expect(GYWDrawing.fromJson(drawing.toJson()), drawing);
    });

    test('Text with font and position', () {
      const font = GYWFont.medium;

      const GYWDrawing drawing = TextDrawing(
        text: "Text with font and position",
        left: 150,
        top: 250,
        font: font,
      );

      expect(GYWDrawing.fromJson(drawing.toJson()), drawing);
    });

    test('Icon', () {
      const GYWIcon icon = GYWIcon.checkbox;

      const GYWDrawing drawing = IconDrawing(icon);

      expect(GYWDrawing.fromJson(drawing.toJson()), drawing);
    });

    test('Icon with position', () {
      const GYWIcon icon = GYWIcon.up;

      const GYWDrawing drawing = IconDrawing(
        icon,
        left: 120,
        top: 220,
      );

      expect(GYWDrawing.fromJson(drawing.toJson()), drawing);
    });

    test('Icon with color', () {
      const GYWIcon icon = GYWIcon.left;

      const GYWDrawing drawing = IconDrawing(
        icon,
        left: 120,
        top: 220,
        color: Colors.green,
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

      for (final GYWIcon icon in GYWIcon.values) {
        if (icon == GYWIcon.key_num) {
          // # symbol is not managed correctly
          continue;
        }

        expect(
          File("$assetFolderPath/${icon.pathPng}").existsSync(),
          isTrue,
          reason: "File of $icon is missing",
        );

        expect(
          File("$assetFolderPath/${icon.pathSvg}").existsSync(),
          isTrue,
          reason: "File of $icon is missing",
        );
      }
    });
  });
}
