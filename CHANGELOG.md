## 1.1.5
* [ADD] Add spinner image

## 1.1.4

* [FIX] Make icon scale deserialization work also with integers, not only doubles
* [ADD] Add a new drawing for colored rectangles which allows for partially clearing the screen
* [FIX] Fix blank.svg not rendering
* [ADD] Add `SpinnerDrawing` for drawing animated spinners
* [FIX] Fix bluetooth not enabled error when it's actually enabled

## 1.1.3
* [DEL] Deprecate delays when sending commands and set their default value to 0
* [IMP] Support custom icons
* [DEL] Deprecate the `setFont` function and send font size and color through Bluetooth
* [ADD] Add SVG icons and scaling factor
* [FIX] Replace the old rename PNG icon with the new one
* [IMP] Improve code documentation
* [IMP] Add support for wrapping TextDrawings on multiple lines

## 1.1.2
* [ADD] Add size and color parameters to TextDrawing
* [ADD] Convert WhiteScreen into BlankScreen with a color parameter
* [FIX] Upgrade flutter_blue_plus version
* [ADD] Add a method to enable or disable the display backlight
* [ADD] Add the build, help, and camera icons
* [ADD] Add the chat, nfc, warning, and wifi icons
* [ADD] Add commands for changing the brightness and contrast

## 1.1.1
* [IMP] Integrate font in text control instruction
* [ADD] Add a method to manually set the default font
* [REFACTOR] Refactor method names and JSON keys
* [ADD] Add keypad icons
* [ADD] Add a color parameter to IconDrawing
* [FIX] Fix deadlock on scan error

## 1.1.0
* [ADD] Add new icons
* [IMP] Optimisation for TextDrawing font
* [IMP] Optimisation of characteristics discovery
* [FIX] Add already connected devices to list of devices
* [FIX] Add bluetoothOnAsync call to manually refresh Bluetooth Status
* [DEL] Remove every deprecated methods from aRdent 0
* [ADD] Add more advanced linting rules
* [ADD] Add a method to manually turn on the display
* [REFACTOR] Prefix custom object with GYW
* [DOC] Improve README file
* [REFACTOR] Use enums instead of static class

## 1.0.0
* [ADD] Update Bluetooth communication for aRdent 1
* [ADD] Update fonts and icons for aRdent 1

## 0.2.4
* [ADD] Implementation of automated tests for drawings
* [FIX] Fix the fontweight of "big basic" font
* [FIX] Detection of device disconnection

## 0.2.3
* [IMP] Improve the Bluetooth status detection
* [IMP] Serialization of Drawings
* [FIX] Use the correct sizes for fonts

## 0.2.2
* [DOC] Improve docstrings
* [FEAT] Set up of Onepub

## 0.2.1
* [DOC] Improve README and docstrings
* [REFACTOR] Refactor GYWFont class to migrate from enum to class

## 0.2.0
* [FEAT] Support 27 80x80 icons
* [DOC] Example to explain how to use the library

## 0.1.0
* [FEAT] Scan for devices available through Bluetooth
* [FEAT] Establish a Bluetooth connection with a device
* [FEAT] Send data to a GYW device using the display characteristic
* [FEAT] New type of drawings: Text, White screen
