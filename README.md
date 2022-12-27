# flutter_gyw

This package is developed and maintained by the Belgian company Get your Way since 2022. It aims to provide an interface to be able their device with a Flutter application.

WARNING This package is still in development and is private. Therefore, you are not allowed to distribute it without Get Your Way agreement. The team is fully open to your suggestions for the future of the package. If you find a bug, do not hesitate to contact us. 

## Features

### Bluetooth capability

* Connection to any Bluetooth device (unsecured)
* Disconnection to a Bluetooth device previously connected
* Scan for surrounding Bluetooth devices

### GYW display capabilities

* Display a text at a given postion
* Font selection
  * check `fonts.dart` [documentation](flutter_gyw/GYWFonts-class.html) for details
* Display an 80x80 icon at a given position
  * check `icons.dart` [documentation](flutter_gyw/GYWIcons-class.html) for details
* Provide the specification of the GYW aRdent device screen
  * check `screen.dart` [documentation](flutter_gyw/GYWScreenParameters-class.html) for details

## Installation

## Installation

To install the package, add this to your `pubspec.yaml` file:

Using onepub
```yaml
dependencies:
  flutter_gyw:
    hosted: https://onepub.dev/api/xvppsdavuh
    version: ^0.2.2
```

Using Github repository
```yaml
dependencies:
  flutter_gyw:
    git:
      url: git@github.com:getyourway/flutter_gyw.git
      ref: master
```

Now in your Dart code, you can use

```dart
import 'package:flutter_gyw/flutter_gyw.dart';
```

## Usage

### Step 1 : Scan for Bluetooth Device

First you need to scan for the surrounding Bluetooth device. To do so, use the `Bluetoothmanager`

```dart
await BluetoothManager.instance.refreshDevices();

final List<BTDevice> devices = BluetoothManager.instance.devices;
```

### Step 2 : Connect to a BTDevice

```dart
// TODO: Choose a device from the devices list here above
final BTDevice device;

await device.connect();
```

### Step 3 : Make a drawing

```dart
final List<Drawing> drawings = [
  TextDrawing(
    text: "Hello world",
    left: 40,
    top: 40,
  ),
];
```

### Step 4 : Send the drawings

```dart
for (Drawing drawing in drawings) {
  final Map<String, dynamic> data = drawing.toBluetoothJson();

  device.displayData(data);
}
```

## Additional information

This package is still in development. Feel free to add new feature or to contact Get Your Way.

## Licence

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

## Troubleshooting

### My GYW device is not listed in the list of devices, what can I do?

1. Check that the GYW device is on and not connected to any other device
2. Switch it off and back up
3. Kill your app and restart it, the disconnection process may not have been correctly

### How can I reset the screen of my GYW device?

GYW drawings appears on the screen as a stack, i.e. each new drawing will be printed on the previous one. Therefore, to reset the screen, you need to send a white screen that will override the whole screen.

```dart
final Drawing whiteScreen = const WhiteScreen();

device.displayData(whiteScreen.toBluetoothJson());
```

### How can I have bigger icons?

For now, only a few 80x80 icons are supported. New icons and different sizes will be added in future versions.
