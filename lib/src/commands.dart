import "package:flutter/services.dart";

/// A class gathering the services used on aRdent
enum GYWService {
  /// Service to control the display
  display("9f3443f3-5149-4d53-9b92-35def7b82e51");

  final String uuid;

  const GYWService(this.uuid);
}

/// A class gathering the characteristics used on aRdent
enum GYWCharacteristic {
  /// Characterisitic to control the display
  ctrlDisplay("9f3443f3-5149-4d53-9b92-35def7b82e52"),

  /// Characteristic to give data to the display
  nameDisplay("9f3443f3-5149-4d53-9b92-35def7b82e53");

  /// The UUID of the characteristic
  final String uuid;

  const GYWCharacteristic(this.uuid);
}

/// A code to operate aRdent smart glasses
enum GYWControlCode {
  /// Show an image on the screen
  displayImage(0x02),

  /// Show a text on the screen
  displayText(0x03),

  /// Clear the screen
  clear(0x05),

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

  /// Creates a Bluetooth command.
  const GYWBtCommand(this.characteristic, this.data);
}
