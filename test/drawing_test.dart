import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gyw/flutter_gyw.dart';
import 'package:flutter_gyw/src/fonts.dart';
import 'package:flutter_gyw/src/icons.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("JSON", () {
    test('blank screen w/o color', () {
      const GYWDrawing drawing = BlankScreen();

      expect(GYWDrawing.fromJson(drawing.toJson()), drawing);
    });

    test('blank screen w/ color', () {
      const GYWDrawing drawing = BlankScreen(color: Colors.red);

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
      final GYWFont font = GYWFonts.medium.font;

      final GYWDrawing drawing = TextDrawing(
        text: "Text with font",
        font: font,
      );

      expect(GYWDrawing.fromJson(drawing.toJson()), drawing);
    });

    test('Text with font and position', () {
      final font = GYWFonts.medium.font;

      final GYWDrawing drawing = TextDrawing(
        text: "Text with font and position",
        left: 150,
        top: 250,
        font: font,
      );

      expect(GYWDrawing.fromJson(drawing.toJson()), drawing);
    });

    test('Icon', () {
      final GYWIcon icon = GYWIcons.checkbox.icon;

      final GYWDrawing drawing = IconDrawing(icon);

      expect(GYWDrawing.fromJson(drawing.toJson()), drawing);
    });

    test('Icon with position', () {
      final GYWIcon icon = GYWIcons.up.icon;

      final GYWDrawing drawing = IconDrawing(
        icon,
        left: 120,
        top: 220,
      );

      expect(GYWDrawing.fromJson(drawing.toJson()), drawing);
    });

    test('Icon with color', () {
      final GYWIcon icon = GYWIcons.left.icon;

      final GYWDrawing drawing = IconDrawing(
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

      for (final GYWIcons icon in GYWIcons.values) {
        if (icon == GYWIcons.key_num) {
          // # symbol is not managed correctly
          continue;
        }

        expect(
          File("$assetFolderPath/${icon.icon.pathPng}").existsSync(),
          isTrue,
          reason: "File of $icon is missing",
        );

        expect(
          File("$assetFolderPath/${icon.icon.pathSvg}").existsSync(),
          isTrue,
          reason: "File of $icon is missing",
        );
      }
    });
  });
}
