import 'dart:typed_data';

/// Convert a int32 into bytes
Uint8List int32Bytes(
  int value, {
  int length = 1,
  Endian endian = Endian.little,
}) =>
    Uint8List(length)..buffer.asByteData().setInt32(0, value, endian);
