import 'package:flutter/services.dart';

/// A class gathering the characteristics used on aRdent
enum GYWCharacteristic {
  /// Characterisitic to control the display
  ctrlDisplay("00004c31-0000-1000-8000-00805f9b34fb"),

  /// Characteristic to give data to the display
  nameDisplay("00004c32-0000-1000-8000-00805f9b34fb");

  /// The UUID of the characteristic
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

  /// Change the contrast
  setContrast(0x06),

  /// Change the brightness
  setBrightness(0x07),

  /// Change the text font of the next text elements
  setFont(0x08),

  /// Enable or disable screen auto-rotate
  autoRotateScreen(0x0A),

  /// Enable or disable the display backlight
  enableBacklight(0x0B),

  /// Draw a colored rectangle
  drawRectangle(0x0C),

  /// Display an animated spinner
  displaySpinner(0x0D);

  /// The Control code value used internally on the device
  final int value;

  const GYWControlCode(this.value);
}

/// A representation of a Bluetooth write operation to apply
class GYWBtCommand {
  /// The Bluetooth characteristic on which to write some data
  final GYWCharacteristic characteristic;

  /// The data to write on the characteristic
  final Uint8List data;

  const GYWBtCommand(this.characteristic, this.data);
}
