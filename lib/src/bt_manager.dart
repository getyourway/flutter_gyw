import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'bt_device.dart';
import 'exceptions.dart';

/// A class used to interact with Bluetooth devices
class BTManager {
  /// The Bluetooth Manager used in your whole application
  static final BTManager instance = BTManager._();

  BTManager._() {
    init();
  }

  Future<void> init() async {
    bluetoothOn = await _bluetoothOnAsync;

    FlutterBluePlus.instance.state.listen((state) {
      if (bluetoothOn != (state == BluetoothState.on)) {
        bluetoothOn = state == BluetoothState.on;
        if (onBluetoothStatusChange != null) {
          onBluetoothStatusChange!(bluetoothOn);
        }
      }
    });
  }

  /// List of devices available for a Bluetooth connection
  List<BTDevice> devices = [];

  /// Status value indicating that the manager is searching around for devices
  bool _isScanning = false;

  /// Whether the Bluetooth is on
  bool bluetoothOn = false;

  /// Function triggered when there is a Bluetooth status change
  void Function(bool)? onBluetoothStatusChange;

  Future<bool> get _bluetoothOnAsync async {
    final flutterBlue = FlutterBluePlus.instance;

    return await flutterBlue.isOn && await flutterBlue.isAvailable;
  }

  void _addDevice(BTDevice device) {
    final index = devices.indexWhere(
      (element) => element.id == device.id,
    );

    if (index == -1) {
      // Device not found in device list
      devices.insert(0, device);
    } else {
      devices[index] = device;
    }
  }

  /// Scan for Bluetooth devices
  Future<void> refreshDevices({
    Duration timeout = const Duration(seconds: 3),
    int deviceLifeDuration = 10,
    int minimumRssi = 0,
    void Function(BTDevice)? onResult,
  }) async {
    if (!bluetoothOn) {
      throw const GYWStatusException("Bluetooth is not enabled");
    }

    if (_isScanning) {
      throw const GYWStatusException("Scan already in progress");
    } else {
      _isScanning = true;
    }

    final flutterBlue = FlutterBluePlus.instance;

    // Get devices that are already connected
    final connectedDevices = await flutterBlue.connectedDevices;

    // Add them to the manager list
    for (BluetoothDevice fbDevice in connectedDevices) {
      final device = BTDevice(
        fbDevice: fbDevice,
        lastRssi: await fbDevice.readRssi(),
        lastSeen: DateTime.now(),
      );
      await device.connect();

      // Add device to device list
      _addDevice(device);
    }

    flutterBlue.scan(timeout: timeout, allowDuplicates: true).listen((result) {
      if (result.rssi.abs() < minimumRssi) {
        // Signal too weak : Skip result
        return;
      }

      late BTDevice device;
      try {
        device = devices.firstWhere(
          (btDevice) => btDevice.id == result.device.id.id,
        );

        // Update existing device info
        device.lastRssi = result.rssi.abs();
        device.lastSeen = DateTime.now();
      } on StateError {
        // Device has not been added to the list yet
        device = BTDevice(
          fbDevice: result.device,
          lastRssi: result.rssi.abs(),
          lastSeen: DateTime.now(),
        );
        devices.insert(0, device);
      } finally {
        // Insert the device at the right place
        devices.sort();

        // apply user custom function
        if (onResult != null) onResult(device);
      }
    });

    await Future.delayed(
      timeout,
      () async {
        try {
          await stopScan();
        } finally {
          final now = DateTime.now();
          devices.removeWhere(
            (btDevice) =>
                now.difference(btDevice.lastSeen).inSeconds >
                deviceLifeDuration,
          );
          devices.sort();
        }
      },
    );
  }

  /// Stop the current scan.
  /// Throws a GYWStatusException if a scan is not in progress
  Future<void> stopScan() async {
    if (!_isScanning) {
      throw const GYWStatusException("Scan is not in progress.");
    }

    try {
      await FlutterBluePlus.instance.stopScan();
    } finally {
      _isScanning = false;
    }
  }
}
