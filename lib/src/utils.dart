import 'dart:ui';

/// Converts an hexadecimal string of length 8 into a Flutter color
Color? colorFromHex(String? value) {
  if ((value?.length ?? 0) != 8) {
    return null;
  }

  final int? colorValue = int.tryParse(value!, radix: 16);
  if (colorValue == null || colorValue > 0xffffffff) {
    return null;
  }

  return Color(colorValue);
}

String hexFromColor(Color color) {
  return "${color.alpha.toRadixString(16).padLeft(2, "0")}"
      "${color.red.toRadixString(16).padLeft(2, "0")}"
      "${color.green.toRadixString(16).padLeft(2, "0")}"
      "${color.blue.toRadixString(16).padLeft(2, "0")}";
}
