import 'dart:typed_data';

/// Convert a int32 into bytes
Uint8List int32Bytes(
  int value, {
  Endian endian = Endian.little,
}) =>
    Uint8List(4)..buffer.asByteData().setInt32(0, value, endian);

/// Convert a int8 into bytes
Uint8List int8Bytes(
  int value, {
  Endian endian = Endian.little,
}) =>
    Uint8List(1)..buffer.asByteData().setInt8(0, value);
