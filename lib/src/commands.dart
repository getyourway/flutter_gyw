import 'package:flutter/services.dart';

/// A class gathering the characteristics used on aRdent
class GYWCharacteristics {
  static const String ctrlDisplay = "00004c31-0000-1000-8000-00805f9b34fb";
  static const String nameDisplay = "00004c32-0000-1000-8000-00805f9b34fb";
}

/// A class gathering the codes used to operate aRdent smart glasses
class GYWControlCodes {
  static const int startDisplay = 0x01;
  static const int displayImage = 0x02;
  static const int displayText = 0x03;
  static const int clear = 0x05;
  static const int setFont = 0x08;
}

/// A representation of a Bluetooth operation to apply
class GYWBtCommand {
  final String characteristic;
  final Uint8List data;

  const GYWBtCommand(this.characteristic, this.data);
}
