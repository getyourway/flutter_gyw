import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart' as fb;
import 'package:flutter_gyw/src/commands.dart';
import 'package:flutter_gyw/src/drawings.dart';

import 'exceptions.dart';

/// Representation of a Bluetooth device
class BTDevice with ChangeNotifier implements Comparable<BTDevice> {
  /// Encapsulated FlutterBluePlus device
  fb.BluetoothDevice fbDevice;

  /// Time when the device was last detected
  late DateTime lastSeen;

  bool _isConnecting = false;
  bool _isDisconnecting = false;
  bool _isConnected = false;
  bool _screenOn = false;

  /// Status value indicating that a connection to the device is in progress
  bool get isConnecting => _isConnecting;

  /// Status value indicating that a connection to the device is in progress
  bool get isDisconnecting => _isDisconnecting;

  /// Status value indicating that the device is connected
  bool get isConnected => _isConnected;

  /// Status value indicating whether the screen device has been turned off or no
  bool get screenOn => _screenOn;

  late int _lastRssi;

  /// Strength of the signal when the device was last detected
  int get lastRssi => _lastRssi;

  /// By setting the lastRssi, the lastSeen value is also updated
  set lastRssi(int lastRssi) {
    _lastRssi = lastRssi;
    lastSeen = DateTime.now();
    notifyListeners();
  }

  StreamSubscription<fb.BluetoothDeviceState>? _deviceStateListener;

  /// Bluetooth charactersitic for sending display commands
  @Deprecated("This characteristic was used with aRdent 0 "
      "and should not be used anymore.")
  fb.BluetoothCharacteristic? displayCharacteristic;

  /// Bluetooth charactersitic for sending display control commands
  fb.BluetoothCharacteristic? displayControlCharacteristic;

  /// Bluetooth charactersitic for sending display data commands
  fb.BluetoothCharacteristic? displayDataCharacteristic;

  BTDevice({
    required this.fbDevice,
    required int lastRssi,
    DateTime? lastSeen,
  }) {
    this.lastRssi = lastRssi;
    if (lastSeen != null) this.lastSeen = lastSeen;
  }

  /// Name of the device
  String get name => fbDevice.name;

  /// UUID of the device
  String get id => fbDevice.id.id;

  /// Connect the Bluetooth device to the current device
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

      _deviceStateListener = fbDevice.state.listen((state) async {
        if (state == fb.BluetoothDeviceState.disconnecting ||
            state == fb.BluetoothDeviceState.disconnected) {
          await disconnect();
        }
      });

      displayControlCharacteristic =
          await _findCharacteristic(GYWCharacteristics.ctrlDisplay);
      displayDataCharacteristic =
          await _findCharacteristic(GYWCharacteristics.nameDisplay);

      _isConnected = true;
    } finally {
      _isConnecting = false;
    }

    notifyListeners();

    return isConnected;
  }

  /// Disconnect the Bluetooth device
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

    try {
      await fbDevice.disconnect();
      _isConnected = false;
    } finally {
      _isDisconnecting = false;
    }

    _screenOn = false;
    notifyListeners();

    return !isConnected;
  }

  Future<fb.BluetoothCharacteristic?> _findCharacteristic(String uuid) async {
    List<fb.BluetoothService?> services = await fbDevice.discoverServices();

    for (fb.BluetoothService? service in services) {
      try {
        return service?.characteristics
            .firstWhere((element) => element.uuid == fb.Guid(uuid));
      } on StateError {
        continue;
      }
    }

    return null;
  }

  @Deprecated("This was used with aRdent 0 and should not be used anymore.")
  Future<fb.BluetoothCharacteristic?> _getGYWDisplayCharacteristic() async {
    if (displayCharacteristic != null) {
      return displayCharacteristic;
    }

    List<fb.BluetoothService?> services = await fbDevice.discoverServices();

    try {
      final service = services.firstWhere(
        (element) =>
            element?.uuid == fb.Guid("030012ac-4202-d690-ec11-006fcee44c41"),
      );

      displayCharacteristic = service?.characteristics.firstWhere(
        (element) =>
            element.uuid == fb.Guid("030012ac-4202-d690-ec11-006fcee44c40"),
      );

      return displayCharacteristic;
    } on StateError {
      return null;
    }
  }

  /// Send data to the aRdent device to display a drawing
  Future<void> displayDrawing(Drawing drawing) async {
    if (!screenOn) {
      await _sendBTCommand(BTCommands.startScreen);
      _screenOn = true;
    }

    // TODO? Reduce delay
    for (BTCommand command in drawing.toCommands()) {
      await Future.delayed(const Duration(milliseconds: 100));
      await _sendBTCommand(command);
    }
  }

  Future<void> _sendBTCommand(BTCommand command) async {
    fb.BluetoothCharacteristic? characteristic;

    if (command.characteristic == GYWCharacteristics.ctrlDisplay) {
      characteristic = displayControlCharacteristic;
    } else if (command.characteristic == GYWCharacteristics.nameDisplay) {
      characteristic = displayDataCharacteristic;
    } else {
      characteristic = await _findCharacteristic(command.characteristic);
    }

    if (characteristic == null) {
      throw const GYWException("Bluetooth characteristic not found");
    } else {
      await _sendData(characteristic, command.data);
    }
  }

  Future<void> _sendData(
    fb.BluetoothCharacteristic characteristic,
    Uint8List data,
  ) async {
    // Split this string into chunks of maximum 20 bytes
    List<Uint8List> chunks = [];
    int start = 0;
    int end = 20;
    while (end < data.length) {
      chunks.add(data.sublist(start, end));
      start += 20;
      end += 20;
    }

    if (start != data.length) {
      chunks.add(data.sublist(start, data.length));
    }

    // Write data on the characteristic by chunks to actually send the data
    for (var chunk in chunks) {
      await characteristic.write(chunk);
    }
  }

  @Deprecated("This was used with aRdent 0. Use displaydrawing method instead")

  /// Send data to the aRdent device to display it on the screen
  Future<void> displayData({
    required Map<String, dynamic> data,
  }) async {
    final characteristic = await _getGYWDisplayCharacteristic();
    if (characteristic == null) {
      throw const GYWException(
        "This device does not support GYW display operation",
      );
    }

    // Convert the data into pseudo-json string
    final jsonBytes = const Utf8Encoder().convert("${jsonEncode(data)}{END}");

    // Split this string into chunks of maximum 20 bytes
    List<Uint8List> chunks = [];
    int start = 0;
    int end = 20;
    while (end < jsonBytes.length) {
      chunks.add(jsonBytes.sublist(start, end));
      start += 20;
      end += 20;
    }

    if (start != jsonBytes.length) {
      chunks.add(jsonBytes.sublist(start, jsonBytes.length));
    }

    // Write data on the characteristic by chunks to actually send the data
    for (var chunk in chunks) {
      await characteristic.write(chunk);
    }
  }

  /// Compare this Bluetooth device to another based on signal strength
  @override
  int compareTo(BTDevice? other) {
    return -lastRssi.compareTo(other?.lastRssi ?? -1);
  }
}
