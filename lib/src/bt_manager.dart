import "package:flutter_blue_plus/flutter_blue_plus.dart";
import "package:flutter_gyw/src/commands.dart";

import "bt_device.dart";
import "exceptions.dart";

/// A class used to interact with Bluetooth devices
class GYWBtManager {
  /// The [GYWBtManager] instance used in your whole application
  static final GYWBtManager instance = GYWBtManager._();

  GYWBtManager._() {
    _init();
  }

  Future<void> _init() async {
    FlutterBluePlus.setLogLevel(LogLevel.info);
    FlutterBluePlus.adapterState.listen((state) {
      if (bluetoothOn != (state == BluetoothAdapterState.on)) {
        bluetoothOn = state == BluetoothAdapterState.on;
        if (onBluetoothStatusChange != null) {
          onBluetoothStatusChange!(bluetoothOn);
        }
      }
    });
  }

  /// The list of devices available for a Bluetooth connection
  List<GYWBtDevice> devices = [];

  /// Whether the manager is searching around for devices
  bool _isScanning = false;

  /// Whether the Bluetooth is active
  bool bluetoothOn = false;

  /// A function triggered when there is a Bluetooth status change
  void Function(bool)? onBluetoothStatusChange;

  void _addDevice(GYWBtDevice device) {
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

  /// Scans for Bluetooth devices in the surroundings
  ///
  /// This refreshes the list of devices available for a connection and throws
  /// [GYWStatusException] in case of error
  Future<void> refreshDevices({
    Duration timeout = const Duration(seconds: 3),
    int deviceLifeDuration = 10,
    int minimumRssi = 0,
    void Function(GYWBtDevice)? onResult,
  }) async {
    if (!bluetoothOn) {
      throw const GYWStatusException("Bluetooth is not enabled");
    }

    if (_isScanning) {
      throw const GYWStatusException("Scan already in progress");
    }

    try {
      _isScanning = true;

      // Get devices that are already connected
      final connectedDevices = await FlutterBluePlus.systemDevices([
        Guid(GYWService.display.uuid),
      ]);

      // Add them to the manager list
      for (final BluetoothDevice fbDevice in connectedDevices) {
        final device = GYWBtDevice(
          fbDevice: fbDevice,
          lastRssi: 0,
          lastSeen: DateTime.now(),
        );
        await device.connect();

        // Add device to device list
        _addDevice(device);
      }

      await FlutterBluePlus.startScan(timeout: timeout, oneByOne: true);

      FlutterBluePlus.scanResults.listen((results) {
        for (final ScanResult result in results) {
          if (result.rssi.abs() < minimumRssi) {
            // Signal too weak : Skip result
            return;
          }

          late GYWBtDevice device;
          try {
            device = devices.firstWhere(
              (btDevice) => btDevice.id == result.device.remoteId.str,
            );

            // Update existing device info
            device.lastRssi = result.rssi.abs();
            device.lastSeen = DateTime.now();
          } on StateError {
            // Device has not been added to the list yet
            device = GYWBtDevice(
              fbDevice: result.device,
              lastRssi: result.rssi.abs(),
              lastSeen: DateTime.now(),
            );
            devices.insert(0, device);
          } finally {
            // Insert the device at the right place
            devices.sort();

            // apply user custom function
            if (onResult != null) {
              onResult(device);
            }
          }
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
    } finally {
      _isScanning = false;
    }
  }

  /// Stops the current scan
  ///
  /// It throws a [GYWStatusException] if a scan is not in progress
  Future<void> stopScan() async {
    if (!_isScanning) {
      throw const GYWStatusException("Scan is not in progress.");
    }

    try {
      await FlutterBluePlus.stopScan();
    } finally {
      _isScanning = false;
    }
  }
}
