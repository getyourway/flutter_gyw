import 'dart:async';
import 'dart:convert';
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

  StreamSubscription<fb.BluetoothConnectionState>? _deviceStateListener;

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
  String get name => fbDevice.localName;

  /// UUID of the device
  String get id => fbDevice.remoteId.str;

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

    _deviceStateListener = fbDevice.connectionState.listen((state) async {
      if (state == fb.BluetoothConnectionState.disconnected) {
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
  Future<void> sendDrawing(
    GYWDrawing drawing, {
    @Deprecated("Delay is no longer needed") int delay = 0,
  }) async {
    final commands = drawing.toCommands();

    for (final GYWBtCommand command in commands) {
      await _sendBTCommand(command);
      if (delay != 0) {
        await Future.delayed(Duration(milliseconds: delay));
      }
    }

    // Save current font
    if (drawing is TextDrawing && drawing.font != null) {
      font = drawing.font;
    }
  }

  /// Send data to the aRdent device to display a [GYWDrawing]
  @Deprecated("This method is going to be replaced by sendDrawing")
  Future<void> displayDrawing(
    GYWDrawing drawing, {
    @Deprecated("Delay is no longer needed") int delay = 0,
  }) async {
    final commands = drawing.toCommands();

    for (final GYWBtCommand command in commands) {
      await _sendBTCommand(command);
      if (delay != 0) {
        await Future.delayed(Duration(milliseconds: delay));
      }
    }

    // Save current font
    if (drawing is TextDrawing && drawing.font != null) {
      font = drawing.font;
    }
  }

  /// Set the default font on the aRdent to display the next [TextDrawing]
  Future<void> setFont(
    GYWFont font, {
    @Deprecated("Delay is no longer needed") int delay = 0,
  }) async {
    final commands = <GYWBtCommand>[
      GYWBtCommand(
        GYWCharacteristic.nameDisplay,
        const Utf8Encoder().convert(font.prefix),
      ),
      GYWBtCommand(
        GYWCharacteristic.ctrlDisplay,
        int8Bytes(GYWControlCode.setFont.value),
      ),
    ];

    for (final GYWBtCommand command in commands) {
      await _sendBTCommand(command);
      if (delay != 0) {
        await Future.delayed(Duration(milliseconds: delay));
      }
    }

    // Save font
    this.font = font;
  }

  /// Set the screen brightness. The value must be between 0 and 1.
  Future<void> setBrightness(
    double value, {
    @Deprecated("Delay is no longer needed") int delay = 0,
  }) async {
    assert(value >= 0 && value <= 1);

    final controlBytes = BytesBuilder()
      ..addByte(GYWControlCode.setBrightness.value)
      ..add(int8Bytes((value * 255).toInt()));

    final command = GYWBtCommand(
      GYWCharacteristic.ctrlDisplay,
      controlBytes.toBytes(),
    );

    await _sendBTCommand(command);
    if (delay != 0) {
      await Future.delayed(Duration(milliseconds: delay));
    }
  }

  /// Set the screen brightness. The value must be between 0 and 1.
  Future<void> setContrast(
    double value, {
    @Deprecated("Delay is no longer needed") int delay = 0,
  }) async {
    assert(value >= 0 && value <= 1);

    final controlBytes = BytesBuilder()
      ..addByte(GYWControlCode.setContrast.value)
      ..add(int8Bytes((value * 255).toInt()));

    final command = GYWBtCommand(
      GYWCharacteristic.ctrlDisplay,
      controlBytes.toBytes(),
    );

    await _sendBTCommand(command);
    if (delay != 0) {
      await Future.delayed(Duration(milliseconds: delay));
    }
  }

  /// Enable or disable the screen autorotation
  Future<void> autoRotateScreen(
    bool enable,
  ) async {
    final controlBytes = BytesBuilder()
      ..addByte(GYWControlCode.autoRotateScreen.value)
      ..addByte(enable ? 1 : 0);

    final command = GYWBtCommand(
      GYWCharacteristic.ctrlDisplay,
      controlBytes.toBytes(),
    );
    await _sendBTCommand(command);
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
    @Deprecated("Delay is no longer needed") int delay = 0,
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
    if (delay != 0) {
      await Future.delayed(Duration(milliseconds: delay));
    }

    _screenOn = true;
  }

  /// Turn the display backlight on or off
  Future<void> enableBacklight(
    bool enable,
  ) async {
    final controlBytes = BytesBuilder()
      ..addByte(GYWControlCode.enableBacklight.value)
      ..addByte(enable ? 1 : 0);

    final command = GYWBtCommand(
      GYWCharacteristic.ctrlDisplay,
      controlBytes.toBytes(),
    );
    await _sendBTCommand(command);
  }

  /// Compare this [GYWBtDevice] to another based on signal strength
  @override
  int compareTo(GYWBtDevice? other) {
    return -lastRssi.compareTo(other?.lastRssi ?? -1);
  }
}
