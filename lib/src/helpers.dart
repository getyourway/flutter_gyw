import 'dart:typed_data';

/// Converts a int32 into bytes
Uint8List int32Bytes(
  int value, {
  Endian endian = Endian.little,
}) =>
    Uint8List(4)..buffer.asByteData().setInt32(0, value, endian);

/// Converts a int8 into bytes
Uint8List int8Bytes(
  int value,
) =>
    Uint8List(1)..buffer.asByteData().setInt8(0, value);

/// Converts a uint16 into bytes
Uint8List uint16Bytes(
  int value, {
  Endian endian = Endian.little,
}) =>
    Uint8List(2)..buffer.asByteData().setUint16(0, value, endian);

/// Converts an ARGB color string to an RGBA8888 bytes array
Uint8List rgba8888BytesFromColorString(String? color) {
  if (color == null) {
    return Uint8List(4);
  }

  final int alpha = int.parse(color.substring(0, 2), radix: 16);
  final int red = int.parse(color.substring(2, 4), radix: 16);
  final int green = int.parse(color.substring(4, 6), radix: 16);
  final int blue = int.parse(color.substring(6, 8), radix: 16);

  return Uint8List.fromList([red, green, blue, alpha]);
}

/// Allows to compare Comparable object using inequality signs
extension Compare<T> on Comparable<T> {
  bool operator >(T other) => compareTo(other) > 0;

  bool operator <(T other) => compareTo(other) < 0;

  bool operator >=(T other) => compareTo(other) >= 0;

  bool operator <=(T other) => compareTo(other) <= 0;
}
