import 'dart:typed_data';

import 'package:flutter/material.dart';

extension Dark on Color {
  Color dark() {
    final hslColor = HSLColor.fromColor(this);
    return hslColor.withLightness(1.0 - hslColor.lightness).toColor();
  }
}

Color colorFromHex(String color) {
  return Color.fromARGB(
    int.parse(color.substring(0, 2), radix: 16),
    int.parse(color.substring(2, 4), radix: 16),
    int.parse(color.substring(4, 6), radix: 16),
    int.parse(color.substring(6, 8), radix: 16),
  );
}

String hexFromColor(Color color) {
  return "${color.alpha.toRadixString(16).padLeft(2, "0")}"
      "${color.red.toRadixString(16).padLeft(2, "0")}"
      "${color.green.toRadixString(16).padLeft(2, "0")}"
      "${color.blue.toRadixString(16).padLeft(2, "0")}";
}

/// Converts a color to an RGBA8888 bytes array
Uint8List rgba8888BytesFromColor(Color color) {
  return Uint8List.fromList([
    color.red,
    color.green,
    color.blue,
    color.alpha,
  ]);
}
