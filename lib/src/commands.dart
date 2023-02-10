import 'package:flutter/services.dart';
import 'package:flutter_gyw/src/helpers.dart';

class GYWCharacteristics {
  static const String ctrlDisplay = "00004c31-0000-1000-8000-00805f9b34fb";
  static const String nameDisplay = "00004c32-0000-1000-8000-00805f9b34fb";
}

class GYWControlCodes {
  static const int startDisplay = 0x01;
  static const int displayImage = 0x02;
  static const int displayText = 0x03;
  static const int clear = 0x05;
  static const int setFont = 0x08;
}

class BTCommand {
  final String characteristic;
  final Uint8List data;

  const BTCommand(this.characteristic, this.data);
}

class BTCommands {
  static final startScreen = BTCommand(
    GYWCharacteristics.ctrlDisplay,
    int32Bytes(GYWControlCodes.startDisplay),
  );
}
