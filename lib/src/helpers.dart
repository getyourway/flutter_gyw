import 'dart:typed_data';

/// Converts a int32 into bytes
Uint8List int32Bytes(
  int value, {
  Endian endian = Endian.little,
}) =>
    Uint8List(4)..buffer.asByteData().setInt32(0, value, endian);

/// Converts a int8 into bytes
Uint8List int8Bytes(
  int value, {
  Endian endian = Endian.little,
}) =>
    Uint8List(1)..buffer.asByteData().setInt8(0, value);

/// Allows to compare Comparable object using inequality signs
extension Compare<T> on Comparable<T> {
  bool operator >(T other) => compareTo(other) > 0;

  bool operator <(T other) => compareTo(other) < 0;

  bool operator >=(T other) => compareTo(other) >= 0;

  bool operator <=(T other) => compareTo(other) <= 0;
}
