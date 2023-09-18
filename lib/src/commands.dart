import 'package:flutter/services.dart';

/// A class gathering the characteristics used on aRdent
enum GYWCharacteristic {
  /// Characterisitic to control the display
  ctrlDisplay("00004c31-0000-1000-8000-00805f9b34fb"),

  /// Characteristic to give data to the display
  nameDisplay("00004c32-0000-1000-8000-00805f9b34fb");

  /// UUID of the characteristic
  final String uuid;

  const GYWCharacteristic(this.uuid);
}

/// A code to operate aRdent smart glasses
enum GYWControlCode {
  /// Switch on the screen
  startDisplay(0x01),

  /// Show an image on the screen
  displayImage(0x02),

  /// Show a text on the screen
  displayText(0x03),

  /// Clear the screen
  clear(0x05),

  /// Change the text font of the next text elements
  setFont(0x08),

  /// Enable or disable the display backlight
  enableBacklight(0x0B);

  /// Control code value used internally on the device
  final int value;

  const GYWControlCode(this.value);
}

/// A representation of a Bluetooth operation to apply
class GYWBtCommand {
  /// Bluetooth characteristic
  final GYWCharacteristic characteristic;

  /// Data to write on the characteristic
  final Uint8List data;

  const GYWBtCommand(this.characteristic, this.data);
}
