import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'bt_device.dart';
import 'exceptions.dart';

/// A class used to interact with Bluetooth devices
class BTManager {
  BTManager._() {
    FlutterBluePlus.instance.state.listen((state) {
      if (bluetoothOn != (state == BluetoothState.on)) {
        bluetoothOn = state == BluetoothState.on;
        if (onBluetoothStatusChange != null) {
          onBluetoothStatusChange!(bluetoothOn);
        }
      }
    });
  }

  /// The Bluetooth Manager used in your whole application
  static final BTManager instance = BTManager._();

  /// List of devices available for a Bluetooth connection
  List<BTDevice> devices = [];

  /// Status value indicating that the manager is searching around for devices
  bool _isScanning = false;

  /// Whether the Bluetooth is on
  bool bluetoothOn = false;

  /// Function triggered when there is a Bluetooth status change
  void Function(bool)? onBluetoothStatusChange;

  /// Checks whether the Bluetooth is enabled on the device
  @Deprecated("This property has been replaced by bluetoothOn")
  Future<bool> get bluetoothStatus async {
    final flutterBluePlus = FlutterBluePlus.instance;

    return await flutterBluePlus.isAvailable && await flutterBluePlus.isOn;
  }

  /// Scan for Bluetooth devices
  Future<void> refreshDevices({
    Duration timeout = const Duration(seconds: 3),
    int deviceLifeDuration = 5,
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

    flutterBlue.startScan(
      timeout: timeout,
      allowDuplicates: true,
    );

    flutterBlue.scanResults.listen((results) {
      for (ScanResult result in results) {
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
          device.lastRssi = result.rssi;
        } on StateError {
          // Device has not been added to the list yet
          device = BTDevice(
            fbDevice: result.device,
            lastRssi: -result.rssi,
            lastSeen: DateTime.now(),
          );
          devices.insert(0, device);
        } finally {
          // Insert the device at the right place and apply user function
          devices.sort();
          if (onResult != null) onResult(device);
        }
      }
    });

    await Future.delayed(
      timeout,
      () async {
        try {
          await stopScan();
        } on GYWStatusException {
          // Scan was already stopped
          // WARNING : Old devices are not removed if the scan is considered
          //           as stopped
          return;
        }

        final now = DateTime.now();
        devices.removeWhere(
          (btDevice) =>
              btDevice.lastSeen.difference(now).inSeconds > deviceLifeDuration,
        );
        devices.sort();
      },
    );
  }

  /// Stop the current scan.
  /// Throws a GYWStatusException if a scan is not in progress
  Future<void> stopScan() async {
    if (!_isScanning) {
      throw const GYWStatusException("Scan is not in progress.");
    }

    await FlutterBluePlus.instance.stopScan();

    _isScanning = false;
  }
}
