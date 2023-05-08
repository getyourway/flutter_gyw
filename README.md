# flutter_gyw

**flutter_gyw** is a Flutter package developed and maintained by the Belgian company [Get Your Way](https://www.getyourway.be) to communicate with their devices via Bluetooth. This package allows developers to create Flutter applications that can send drawings, text, and icons to **aRdent smart glasses**.

Note that this package is still in development and is currently private. As such, you are not allowed to distribute it without Get Your Way's agreement. The team is fully open to your suggestions for the future of the package, and if you find a bug, do not hesitate to contact them.

## Features

### Bluetooth capability

* Connect to any Bluetooth device (unsecured)
* Disconnect from a previously connected Bluetooth device
* Scan for surrounding Bluetooth devices

### GYW display capabilities

* Display a text at a given postion
* Font selection
  * See `fonts.dart` [documentation](flutter_gyw/GYWFont-class.html) for available fonts
* Display a 48x48 icon at a given position
  * See `icons.dart` [documentation](flutter_gyw/GYWIcon-class.html) for available icons
* Provide the specification of the GYW aRdent device screen
  * See `screen.dart` [documentation](flutter_gyw/GYWScreenParameters-class.html) for details

## Installation

To install the package, add this to your `pubspec.yaml` file:

Using Github repository
```yaml
dependencies:
  flutter_gyw:
    git:
      url: https://github.com:getyourway/flutter_gyw.git
      ref: master
```

:bulb: If you want to use the latest features, you can reference the **develop** branch. However, these features are not merged, so they may lead to errors. Please report them if you see some.

Now in your Dart code, you can use

```dart
import 'package:flutter_gyw/flutter_gyw.dart';
```

## Usage

### Step 1 : Scan for Bluetooth Device

First, scan for surrounding Bluetooth devices using the `GYWBtManager` object ([documentation](flutter_gyw/GYWBtManager-class.html)).

```dart
await GYWBtManager.instance.refreshDevices();

final List<GYWBtDevice> devices = GYWBtManager.instance.devices;
```

### Step 2 : Connect to a BTDevice

Then, pick the `GYWBtDevice`  ([documentation](flutter_gyw/GYWBtDevice-class.html)) you are interested in, and establish a connection.

```dart
await device.connect();
```

### Step 3 : Turn the screen on

Notify the device so that it turns it screen on.

```dart
await device.start_display()
```

### Step 4 : Make a drawing

Create a list of drawings that you want to send to the device.

```dart
final List<GYWDrawing> drawings = [
  TextDrawing(
    text: "Hello world",
    left: 40,
    top: 40,
  ),
];
```

### Step 5 : Send the drawings

Send the drawings to the connected device.

```dart
for (GYWDrawing drawing in drawings) {
  device.displayDrawing(drawing);
}
```

> Note: You can use the `delay` parameter of the `displayDrawing` method in order to speed up or down the transfer, but be careful that increasing the transfer rate may affect the reliability of the transfered data, i.e. some drawings may be skipped or badly interpreted.

## Example

A complete example can be found [here](example/example.dart)

## Licence

Copyright (c) 2023 - Get Your Way SRL

This library is licensed under the Apache License, Version 2.0 (the "License"). You may not use this library except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0.

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

## Troubleshooting

### My GYW device is not listed in the list of devices, what can I do?

1. Check that the GYW device is on and not connected to any other device
2. Switch it off and back up
3. Kill your app and restart it, the disconnection process may not have been correctly

### How can I reset the screen of my GYW device?

`GYWDrawing` objects appear on the screen as a stack. Each new drawing will be printed over the previous one. Therefore, to reset the screen, you need to send a white screen that will override the whole screen.

```dart
device.displayDrawing(const WhiteScreen());
```

### How can I have bigger icons?

For now, only a few 48x48 icons are supported. New icons and different sizes will be added in future versions.

### How can I troubleshoot connection issues with my GYW device?

If you encounter issues with connecting to your GYW device, here are a few things you can try:

1. Ensure that Bluetooth is enabled on the device running your Flutter app
2. Ensure that your app has the Bluetooth permissions to scan for and connect to devices.
3. Make sure that the GYW device is within range and not connected to any other device.
4. Check that the GYW device is discoverable by your Flutter app by scanning for devices using `GYWBtManager.instance.refreshDevices()`.
5. If the device is not listed, switch it off and then back on, and start a scan again.
6. Restart your app.
7. If you continue to have issues, please contact our support team for further assistance at [support@getyourway.be](mailto:support@getyourway.be)

### What is the format of the color parameter for the IconDrawing ?

The color parameter of an IconDrawing must be 8 characters long and represents the color in the **ORGB format**.

The ORGB format is a hexadecimal color format used in Flutter that represents the color components of an opaque or transparent color as four two-digit hexadecimal numbers, in the order of **opacity** (**alpha**), **red**, **green**, and **blue**. It is an 8-digit color code that ranges from 00000000 (fully transparent black) to FFFFFFFF (fully opaque white).

In Flutter, you can convert a Material Color to this format with this piece of code:

```dart
color.value.toRadixString(16).padLeft(8, "0");
```
