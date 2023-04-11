import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart' as fb;
import 'package:flutter_gyw/flutter_gyw.dart';

import 'commands.dart';
import 'helpers.dart';

/// Representation of a Bluetooth device
class GYWBtDevice with ChangeNotifier implements Comparable<GYWBtDevice> {
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

  /// Most recently used font (used for the optimisation of [TextDrawing])
  GYWFont? font;

  /// Enable font optimisation
  bool fontOptimized = true;

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

  Map<String, fb.BluetoothCharacteristic?> _characteristics =
      <String, fb.BluetoothCharacteristic?>{};

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
    } on TimeoutException {
      _isConnected = false;
      _isConnecting = false;
      notifyListeners();

      return isConnected;
    } on Exception catch (e, s) {
      log("An error occured during BT Connection", error: e, stackTrace: s);
    }

    // Device is already connected
    _isConnected = true;

    _deviceStateListener = fbDevice.state.listen((state) async {
      if (state == fb.BluetoothDeviceState.disconnecting ||
          state == fb.BluetoothDeviceState.disconnected) {
        await disconnect();
      }
    });

    _isConnecting = false;
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

    // Clear saved characteristics
    _characteristics = <String, fb.BluetoothCharacteristic?>{};

    // Clear font
    font = null;

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
    if (_characteristics[uuid] != null) {
      return _characteristics[uuid];
    }

    final List<fb.BluetoothService?> services =
        await fbDevice.discoverServices();

    for (final fb.BluetoothService? service in services) {
      try {
        final c = service?.characteristics
            .firstWhere((element) => element.uuid == fb.Guid(uuid));

        // Save characteristic in cache
        _characteristics[uuid] = c;

        return c;
      } on StateError {
        continue;
      }
    }

    return null;
  }

  /// Send data to the aRdent device to display a [GYWDrawing]
  Future<void> displayDrawing(
    GYWDrawing drawing, {
    int delay = 60,
  }) async {
    final commands = drawing.toCommands();
    if (fontOptimized && drawing is TextDrawing) {
      if (drawing.font != null && drawing.font == font) {
        // Remove the operations dedicated to setting the text font
        commands.removeRange(0, 2);
      } else {
        font = drawing.font;
      }
    }

    for (final GYWBtCommand command in commands) {
      await _sendBTCommand(command);
      await Future.delayed(Duration(milliseconds: delay));
    }
  }

  Future<void> _sendBTCommand(GYWBtCommand command) async {
    final fb.BluetoothCharacteristic? characteristic =
        await _findCharacteristic(command.characteristic.uuid);

    if (characteristic == null) {
      throw const GYWException("Bluetooth characteristic not found");
    } else {
      await _sendData(characteristic, command.data);
    }
  }

  /// Write data on a Bluetooth characteristic by chunk of 20 bytes
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

      await characteristic.write(chunk);

      start += 20;
      end += 20;
    }
  }

  /// Turn the screen on
  Future<void> startDisplay({
    int delay = 400,
  }) async {
    if (_screenOn) {
      // Skip the command
      return;
    }

    final command = GYWBtCommand(
      GYWCharacteristic.ctrlDisplay,
      int8Bytes(GYWControlCode.startDisplay.value),
    );

    await _sendBTCommand(command);
    await Future.delayed(
      Duration(milliseconds: delay),
    );

    _screenOn = true;
  }

  /// Compare this [GYWBtDevice] to another based on signal strength
  @override
  int compareTo(GYWBtDevice? other) {
    return -lastRssi.compareTo(other?.lastRssi ?? -1);
  }
}
