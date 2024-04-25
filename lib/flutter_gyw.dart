/// This library provides a Flutter interface with aRdent glasses developed.
///
/// The aRdent smart glasses are developed by Get Your Way. They can be seen
/// as a Head-Up Display (HUD) on which are shown drawings (icons, texts, ...).
/// This library can be used to control the display.
library flutter_gyw;

export 'src/bt_device.dart' show GYWBtDevice;
export 'src/bt_manager.dart' show GYWBtManager;
export 'src/drawings.dart'
    show
        GYWDrawing,
        IconDrawing,
        TextDrawing,
        RectangleDrawing,
        SpinnerDrawing,
        AnimationTimingFunction;
export 'src/exceptions.dart' show GYWException, GYWStatusException;
export 'src/fonts.dart' show GYWFont, GYWFonts;
export 'src/icons.dart' show GYWIcon, GYWIcons;
export 'src/screen.dart' show GYWScreenParameters;
