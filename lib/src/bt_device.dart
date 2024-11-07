import "dart:async";
import "dart:developer";
import "dart:typed_data";

import "package:flutter/material.dart";
import "package:flutter_blue_plus/flutter_blue_plus.dart" as fb;
import "package:flutter_gyw/flutter_gyw.dart";
import "package:meta/meta.dart";

import "commands.dart";
import "helpers.dart";

/// The representation of a Bluetooth device in the library
class GYWBtDevice with ChangeNotifier implements Comparable<GYWBtDevice> {
  /// The encapsulated FlutterBluePlus device
  @internal
  fb.BluetoothDevice fbDevice;

  /// The time when the device was last detected
  late DateTime lastSeen;

  bool _isConnecting = false;
  bool _isDisconnecting = false;
  bool _isConnected = false;

  /// Whether the connection to the device is in progress
  bool get isConnecting => _isConnecting;

  /// Whether the disconnection to the device is in progress
  bool get isDisconnecting => _isDisconnecting;

  /// Whether the device is connected
  bool get isConnected => _isConnected;

  late int _lastRssi;

  /// The strength of the signal when the device was last detected
  ///
  /// By setting the lastRssi, the lastSeen value is also updated
  int get lastRssi => _lastRssi;

  set lastRssi(int lastRssi) {
    _lastRssi = lastRssi;
    lastSeen = DateTime.now();
    notifyListeners();
  }

  StreamSubscription<fb.BluetoothConnectionState>? _deviceStateListener;

  final Map<String, fb.BluetoothCharacteristic> _characteristics = {};

  /// Creates a bluetooth device.
  GYWBtDevice({
    required this.fbDevice,
    required int lastRssi,
    DateTime? lastSeen,
  }) {
    this.lastRssi = lastRssi;
    if (lastSeen != null) {
      this.lastSeen = lastSeen;
    }
  }

  /// The name of the device
  String get name => fbDevice.platformName;

  /// The MAC address (or the public UUID) of the device
  String get id => fbDevice.remoteId.str;

  /// Connects the Bluetooth device to the current device
  ///
  /// The method returns `true` if the operation is successful, false otherwise
  Future<bool> connect() async {
    if (isConnecting) {
      throw const GYWStatusException(
        "The device is already triying to be connected.",
      );
    } else if (isDisconnecting) {
      throw const GYWStatusException(
        "The device is already trying to be disconnected.",
      );
    }

    _isConnecting = true;
    _isDisconnecting = false;
    notifyListeners();

    try {
      await fbDevice.connect(timeout: const Duration(seconds: 5));

      // Discover all charactersitics
      _characteristics.clear();
      final services = await fbDevice.discoverServices();

      for (final service in services) {
        for (final characteristic in service.characteristics) {
          _characteristics[characteristic.uuid.toString()] = characteristic;
        }
      }
    } on Exception catch (e, s) {
      log("An error occured during BT Connection", error: e, stackTrace: s);

      _isConnected = false;
      _isConnecting = false;
      notifyListeners();

      return isConnected;
    }

    // Device is already connected
    _isConnected = true;

    _deviceStateListener = fbDevice.connectionState.listen((state) async {
      if (state == fb.BluetoothConnectionState.disconnected) {
        await disconnect();
      }
    });

    _isConnecting = false;
    notifyListeners();

    return isConnected;
  }

  /// Disconnects the Bluetooth device
  ///
  /// The method returns `true` if the operation is successful, false otherwise
  Future<bool> disconnect() async {
    if (isConnecting) {
      throw const GYWStatusException(
        "The device is still trying to be connected.",
      );
    } else if (_isDisconnecting) {
      throw const GYWStatusException(
        "The device is already trying to be disconnected.",
      );
    }
    _isDisconnecting = true;
    notifyListeners();

    // Clear status listener
    if (_deviceStateListener != null) {
      await _deviceStateListener!.cancel();
      _deviceStateListener = null;
    }

    // Clear saved characteristics
    _characteristics.clear();

    try {
      await fbDevice.disconnect();
      _isConnected = false;
    } finally {
      _isDisconnecting = false;
    }

    notifyListeners();

    return !isConnected;
  }

  /// Find a characteristic by its UUID
  @internal
  fb.BluetoothCharacteristic? findCharacteristic(String uuid) {
    return _characteristics[uuid];
  }

  /// Sends data to the aRdent device to display a [GYWDrawing]
  Future<void> sendDrawing(GYWDrawing drawing) async {
    final commands = drawing.toCommands();

    for (final GYWBtCommand command in commands) {
      await _sendBTCommand(command);
    }
  }

  Future<void> _sendBTCommand(GYWBtCommand command) async {
    final characteristic = findCharacteristic(command.characteristic.uuid);

    if (characteristic == null) {
      throw GYWException(
        "Bluetooth characteristic ${command.characteristic.uuid} not found",
      );
    } else {
      await _sendData(characteristic, command.data);
    }
  }

  /// Writes data on a Bluetooth characteristic by chunks of 20 bytes
  Future<void> _sendData(
    fb.BluetoothCharacteristic characteristic,
    Uint8List data,
  ) async {
    int start = 0;
    int end = 20;

    // Write data on the characteristic by chunks to actually send the data
    while (start < data.length) {
      Uint8List chunk;
      if (end < data.length) {
        chunk = data.sublist(start, end);
      } else {
        chunk = data.sublist(start);
      }

      await characteristic.write(chunk, withoutResponse: true);

      start += 20;
      end += 20;
    }
  }

  /// Reset the content of the screen and its background color.
  Future<void> clearScreen({Color? color}) {
    final controlBytes = BytesBuilder();
    controlBytes.add(int8Bytes(GYWControlCode.clear.value));

    if (color != null) {
      // Add color value
      controlBytes.add(rgba8888BytesFromColor(color));
    }

    final command = GYWBtCommand(
      GYWCharacteristic.ctrlDisplay,
      controlBytes.toBytes(),
    );

    return _sendBTCommand(command);
  }

  /// Compares this [GYWBtDevice] to another based on signal strength
  @override
  int compareTo(GYWBtDevice? other) {
    return -lastRssi.compareTo(other?.lastRssi ?? -1);
  }
}
