import "dart:io";

import "package:dart_mappable/dart_mappable.dart";
import "package:flutter/material.dart";
import "package:flutter_gyw/flutter_gyw.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("JSON", () {
    test("Text without optional values", () {
      final GYWDrawing drawing = TextDrawing(
        text: "Text",
        font: GYWFonts.robotoMono.font,
      );

      expect(GYWDrawing.fromJson(drawing.toJson()), drawing);
    });

    test("Text with optional values", () {
      final GYWDrawing drawing = TextDrawing(
        left: 100,
        top: 200,
        text: "Text with position",
        font: GYWFonts.robotoMonoBold.font,
        size: 48,
        colorHex: 0x12345678,
        maxWidth: 300,
        maxLines: 3,
      );

      expect(GYWDrawing.fromJson(drawing.toJson()), drawing);
    });

    test("Icon", () {
      final GYWIcon icon = GYWIcons.checkbox.icon;

      final GYWDrawing drawing = IconDrawing(icon);

      expect(GYWDrawing.fromJson(drawing.toJson()), drawing);
    });

    test("Icon with position", () {
      final GYWIcon icon = GYWIcons.up.icon;

      final GYWDrawing drawing = IconDrawing(
        icon,
        left: 120,
        top: 220,
      );

      expect(GYWDrawing.fromJson(drawing.toJson()), drawing);
    });

    test("Icon with color", () {
      final GYWIcon icon = GYWIcons.left.icon;

      final GYWDrawing drawing = IconDrawing(
        icon,
        left: 120,
        top: 220,
        colorHex: Colors.green.value,
      );

      expect(GYWDrawing.fromJson(drawing.toJson()), drawing);
    });

    test("Unsupported type", () {
      final json = {
        "type": "unsupported",
        "data": "Test",
      };

      expect(() => GYWDrawing.fromMap(json), throwsA(isA<MapperException>()));
    });
  });

  group("Icon assets", () {
    test("All icons", () {
      final assetFolderPath = Platform.environment["UNIT_TEST_ASSETS"];

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
