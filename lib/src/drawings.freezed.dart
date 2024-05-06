// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drawings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TextDrawing {
  int get top => throw _privateConstructorUsedError;
  int get left => throw _privateConstructorUsedError;

  /// The text that must be displayed
  String get text => throw _privateConstructorUsedError;

  /// The [GYWFont] to use
  ///
  /// If no font is given, it uses the most recent one
  GYWFont? get font => throw _privateConstructorUsedError;

  /// The text size. Overrides the font size.
  int? get size => throw _privateConstructorUsedError;

  /// The color of the text.
  int get colorHex => throw _privateConstructorUsedError;

  /// The maximum width (in pixels) of the text.
  ///
  /// It will be wrapped on multiple lines if it is too long.
  /// Null disables the limit.
  int? get maxWidth => throw _privateConstructorUsedError;

  /// The maximum number of lines the text can be wrapped on.
  ///
  /// All extra lines will be ignored.
  /// Null disables the limit.
  int? get maxLines => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TextDrawingCopyWith<TextDrawing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextDrawingCopyWith<$Res> {
  factory $TextDrawingCopyWith(
          TextDrawing value, $Res Function(TextDrawing) then) =
      _$TextDrawingCopyWithImpl<$Res, TextDrawing>;
  @useResult
  $Res call(
      {int top,
      int left,
      String text,
      GYWFont? font,
      int? size,
      int colorHex,
      int? maxWidth,
      int? maxLines});
}

/// @nodoc
class _$TextDrawingCopyWithImpl<$Res, $Val extends TextDrawing>
    implements $TextDrawingCopyWith<$Res> {
  _$TextDrawingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? top = null,
    Object? left = null,
    Object? text = null,
    Object? font = freezed,
    Object? size = freezed,
    Object? colorHex = null,
    Object? maxWidth = freezed,
    Object? maxLines = freezed,
  }) {
    return _then(_value.copyWith(
      top: null == top
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as int,
      left: null == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      font: freezed == font
          ? _value.font
          : font // ignore: cast_nullable_to_non_nullable
              as GYWFont?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      colorHex: null == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as int,
      maxWidth: freezed == maxWidth
          ? _value.maxWidth
          : maxWidth // ignore: cast_nullable_to_non_nullable
              as int?,
      maxLines: freezed == maxLines
          ? _value.maxLines
          : maxLines // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextDrawingImplCopyWith<$Res>
    implements $TextDrawingCopyWith<$Res> {
  factory _$$TextDrawingImplCopyWith(
          _$TextDrawingImpl value, $Res Function(_$TextDrawingImpl) then) =
      __$$TextDrawingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int top,
      int left,
      String text,
      GYWFont? font,
      int? size,
      int colorHex,
      int? maxWidth,
      int? maxLines});
}

/// @nodoc
class __$$TextDrawingImplCopyWithImpl<$Res>
    extends _$TextDrawingCopyWithImpl<$Res, _$TextDrawingImpl>
    implements _$$TextDrawingImplCopyWith<$Res> {
  __$$TextDrawingImplCopyWithImpl(
      _$TextDrawingImpl _value, $Res Function(_$TextDrawingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? top = null,
    Object? left = null,
    Object? text = null,
    Object? font = freezed,
    Object? size = freezed,
    Object? colorHex = null,
    Object? maxWidth = freezed,
    Object? maxLines = freezed,
  }) {
    return _then(_$TextDrawingImpl(
      top: null == top
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as int,
      left: null == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      font: freezed == font
          ? _value.font
          : font // ignore: cast_nullable_to_non_nullable
              as GYWFont?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      colorHex: null == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as int,
      maxWidth: freezed == maxWidth
          ? _value.maxWidth
          : maxWidth // ignore: cast_nullable_to_non_nullable
              as int?,
      maxLines: freezed == maxLines
          ? _value.maxLines
          : maxLines // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$TextDrawingImpl extends _TextDrawing {
  const _$TextDrawingImpl(
      {this.top = 0,
      this.left = 0,
      required this.text,
      this.font,
      this.size,
      this.colorHex = 0xFF000000,
      this.maxWidth,
      this.maxLines})
      : super._();

  @override
  @JsonKey()
  final int top;
  @override
  @JsonKey()
  final int left;

  /// The text that must be displayed
  @override
  final String text;

  /// The [GYWFont] to use
  ///
  /// If no font is given, it uses the most recent one
  @override
  final GYWFont? font;

  /// The text size. Overrides the font size.
  @override
  final int? size;

  /// The color of the text.
  @override
  @JsonKey()
  final int colorHex;

  /// The maximum width (in pixels) of the text.
  ///
  /// It will be wrapped on multiple lines if it is too long.
  /// Null disables the limit.
  @override
  final int? maxWidth;

  /// The maximum number of lines the text can be wrapped on.
  ///
  /// All extra lines will be ignored.
  /// Null disables the limit.
  @override
  final int? maxLines;

  @override
  String toString() {
    return 'TextDrawing(top: $top, left: $left, text: $text, font: $font, size: $size, colorHex: $colorHex, maxWidth: $maxWidth, maxLines: $maxLines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextDrawingImpl &&
            (identical(other.top, top) || other.top == top) &&
            (identical(other.left, left) || other.left == left) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.font, font) || other.font == font) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.colorHex, colorHex) ||
                other.colorHex == colorHex) &&
            (identical(other.maxWidth, maxWidth) ||
                other.maxWidth == maxWidth) &&
            (identical(other.maxLines, maxLines) ||
                other.maxLines == maxLines));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, top, left, text, font, size, colorHex, maxWidth, maxLines);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextDrawingImplCopyWith<_$TextDrawingImpl> get copyWith =>
      __$$TextDrawingImplCopyWithImpl<_$TextDrawingImpl>(this, _$identity);
}

abstract class _TextDrawing extends TextDrawing {
  const factory _TextDrawing(
      {final int top,
      final int left,
      required final String text,
      final GYWFont? font,
      final int? size,
      final int colorHex,
      final int? maxWidth,
      final int? maxLines}) = _$TextDrawingImpl;
  const _TextDrawing._() : super._();

  @override
  int get top;
  @override
  int get left;
  @override

  /// The text that must be displayed
  String get text;
  @override

  /// The [GYWFont] to use
  ///
  /// If no font is given, it uses the most recent one
  GYWFont? get font;
  @override

  /// The text size. Overrides the font size.
  int? get size;
  @override

  /// The color of the text.
  int get colorHex;
  @override

  /// The maximum width (in pixels) of the text.
  ///
  /// It will be wrapped on multiple lines if it is too long.
  /// Null disables the limit.
  int? get maxWidth;
  @override

  /// The maximum number of lines the text can be wrapped on.
  ///
  /// All extra lines will be ignored.
  /// Null disables the limit.
  int? get maxLines;
  @override
  @JsonKey(ignore: true)
  _$$TextDrawingImplCopyWith<_$TextDrawingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$IconDrawing {
  int get top => throw _privateConstructorUsedError;
  int get left => throw _privateConstructorUsedError;

  /// The displayed [GYWIcon]
  GYWIcon get icon => throw _privateConstructorUsedError;

  /// Hexadecimal code of the icon fill color
  int get colorHex => throw _privateConstructorUsedError;

  /// The icon scaling factor.
  double get scale => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IconDrawingCopyWith<IconDrawing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IconDrawingCopyWith<$Res> {
  factory $IconDrawingCopyWith(
          IconDrawing value, $Res Function(IconDrawing) then) =
      _$IconDrawingCopyWithImpl<$Res, IconDrawing>;
  @useResult
  $Res call({int top, int left, GYWIcon icon, int colorHex, double scale});
}

/// @nodoc
class _$IconDrawingCopyWithImpl<$Res, $Val extends IconDrawing>
    implements $IconDrawingCopyWith<$Res> {
  _$IconDrawingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? top = null,
    Object? left = null,
    Object? icon = null,
    Object? colorHex = null,
    Object? scale = null,
  }) {
    return _then(_value.copyWith(
      top: null == top
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as int,
      left: null == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as int,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as GYWIcon,
      colorHex: null == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as int,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IconDrawingImplCopyWith<$Res>
    implements $IconDrawingCopyWith<$Res> {
  factory _$$IconDrawingImplCopyWith(
          _$IconDrawingImpl value, $Res Function(_$IconDrawingImpl) then) =
      __$$IconDrawingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int top, int left, GYWIcon icon, int colorHex, double scale});
}

/// @nodoc
class __$$IconDrawingImplCopyWithImpl<$Res>
    extends _$IconDrawingCopyWithImpl<$Res, _$IconDrawingImpl>
    implements _$$IconDrawingImplCopyWith<$Res> {
  __$$IconDrawingImplCopyWithImpl(
      _$IconDrawingImpl _value, $Res Function(_$IconDrawingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? top = null,
    Object? left = null,
    Object? icon = null,
    Object? colorHex = null,
    Object? scale = null,
  }) {
    return _then(_$IconDrawingImpl(
      top: null == top
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as int,
      left: null == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as int,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as GYWIcon,
      colorHex: null == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as int,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$IconDrawingImpl extends _IconDrawing {
  const _$IconDrawingImpl(
      {this.top = 0,
      this.left = 0,
      required this.icon,
      this.colorHex = 0xFF000000,
      this.scale = 1.0})
      : super._();

  @override
  @JsonKey()
  final int top;
  @override
  @JsonKey()
  final int left;

  /// The displayed [GYWIcon]
  @override
  final GYWIcon icon;

  /// Hexadecimal code of the icon fill color
  @override
  @JsonKey()
  final int colorHex;

  /// The icon scaling factor.
  @override
  @JsonKey()
  final double scale;

  @override
  String toString() {
    return 'IconDrawing(top: $top, left: $left, icon: $icon, colorHex: $colorHex, scale: $scale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IconDrawingImpl &&
            (identical(other.top, top) || other.top == top) &&
            (identical(other.left, left) || other.left == left) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.colorHex, colorHex) ||
                other.colorHex == colorHex) &&
            (identical(other.scale, scale) || other.scale == scale));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, top, left, icon, colorHex, scale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IconDrawingImplCopyWith<_$IconDrawingImpl> get copyWith =>
      __$$IconDrawingImplCopyWithImpl<_$IconDrawingImpl>(this, _$identity);
}

abstract class _IconDrawing extends IconDrawing {
  const factory _IconDrawing(
      {final int top,
      final int left,
      required final GYWIcon icon,
      final int colorHex,
      final double scale}) = _$IconDrawingImpl;
  const _IconDrawing._() : super._();

  @override
  int get top;
  @override
  int get left;
  @override

  /// The displayed [GYWIcon]
  GYWIcon get icon;
  @override

  /// Hexadecimal code of the icon fill color
  int get colorHex;
  @override

  /// The icon scaling factor.
  double get scale;
  @override
  @JsonKey(ignore: true)
  _$$IconDrawingImplCopyWith<_$IconDrawingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RectangleDrawing {
  int get top => throw _privateConstructorUsedError;
  int get left => throw _privateConstructorUsedError;

  /// The rectangle width.
  int get width => throw _privateConstructorUsedError;

  /// The rectangle height.
  int get height => throw _privateConstructorUsedError;

  /// The fill color. If null, the rectangle will use the current background color.
  int? get colorHex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RectangleDrawingCopyWith<RectangleDrawing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RectangleDrawingCopyWith<$Res> {
  factory $RectangleDrawingCopyWith(
          RectangleDrawing value, $Res Function(RectangleDrawing) then) =
      _$RectangleDrawingCopyWithImpl<$Res, RectangleDrawing>;
  @useResult
  $Res call({int top, int left, int width, int height, int? colorHex});
}

/// @nodoc
class _$RectangleDrawingCopyWithImpl<$Res, $Val extends RectangleDrawing>
    implements $RectangleDrawingCopyWith<$Res> {
  _$RectangleDrawingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? top = null,
    Object? left = null,
    Object? width = null,
    Object? height = null,
    Object? colorHex = freezed,
  }) {
    return _then(_value.copyWith(
      top: null == top
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as int,
      left: null == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as int,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      colorHex: freezed == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RectangleDrawingImplCopyWith<$Res>
    implements $RectangleDrawingCopyWith<$Res> {
  factory _$$RectangleDrawingImplCopyWith(_$RectangleDrawingImpl value,
          $Res Function(_$RectangleDrawingImpl) then) =
      __$$RectangleDrawingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int top, int left, int width, int height, int? colorHex});
}

/// @nodoc
class __$$RectangleDrawingImplCopyWithImpl<$Res>
    extends _$RectangleDrawingCopyWithImpl<$Res, _$RectangleDrawingImpl>
    implements _$$RectangleDrawingImplCopyWith<$Res> {
  __$$RectangleDrawingImplCopyWithImpl(_$RectangleDrawingImpl _value,
      $Res Function(_$RectangleDrawingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? top = null,
    Object? left = null,
    Object? width = null,
    Object? height = null,
    Object? colorHex = freezed,
  }) {
    return _then(_$RectangleDrawingImpl(
      top: null == top
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as int,
      left: null == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as int,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      colorHex: freezed == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$RectangleDrawingImpl extends _RectangleDrawing {
  const _$RectangleDrawingImpl(
      {this.top = 0,
      this.left = 0,
      required this.width,
      required this.height,
      this.colorHex})
      : super._();

  @override
  @JsonKey()
  final int top;
  @override
  @JsonKey()
  final int left;

  /// The rectangle width.
  @override
  final int width;

  /// The rectangle height.
  @override
  final int height;

  /// The fill color. If null, the rectangle will use the current background color.
  @override
  final int? colorHex;

  @override
  String toString() {
    return 'RectangleDrawing(top: $top, left: $left, width: $width, height: $height, colorHex: $colorHex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RectangleDrawingImpl &&
            (identical(other.top, top) || other.top == top) &&
            (identical(other.left, left) || other.left == left) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.colorHex, colorHex) ||
                other.colorHex == colorHex));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, top, left, width, height, colorHex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RectangleDrawingImplCopyWith<_$RectangleDrawingImpl> get copyWith =>
      __$$RectangleDrawingImplCopyWithImpl<_$RectangleDrawingImpl>(
          this, _$identity);
}

abstract class _RectangleDrawing extends RectangleDrawing {
  const factory _RectangleDrawing(
      {final int top,
      final int left,
      required final int width,
      required final int height,
      final int? colorHex}) = _$RectangleDrawingImpl;
  const _RectangleDrawing._() : super._();

  @override
  int get top;
  @override
  int get left;
  @override

  /// The rectangle width.
  int get width;
  @override

  /// The rectangle height.
  int get height;
  @override

  /// The fill color. If null, the rectangle will use the current background color.
  int? get colorHex;
  @override
  @JsonKey(ignore: true)
  _$$RectangleDrawingImplCopyWith<_$RectangleDrawingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SpinnerDrawing {
  int get top => throw _privateConstructorUsedError;
  int get left => throw _privateConstructorUsedError;

  /// The scale of the image.
  double get scale => throw _privateConstructorUsedError;

  /// The fill color. If null, the image colors will be preserved.
  int? get colorHex => throw _privateConstructorUsedError;

  /// The curve applied while spinning.
  AnimationTimingFunction get animationTimingFunction =>
      throw _privateConstructorUsedError;

  /// How many rotations per second.
  double get spinsPerSecond => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpinnerDrawingCopyWith<SpinnerDrawing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpinnerDrawingCopyWith<$Res> {
  factory $SpinnerDrawingCopyWith(
          SpinnerDrawing value, $Res Function(SpinnerDrawing) then) =
      _$SpinnerDrawingCopyWithImpl<$Res, SpinnerDrawing>;
  @useResult
  $Res call(
      {int top,
      int left,
      double scale,
      int? colorHex,
      AnimationTimingFunction animationTimingFunction,
      double spinsPerSecond});
}

/// @nodoc
class _$SpinnerDrawingCopyWithImpl<$Res, $Val extends SpinnerDrawing>
    implements $SpinnerDrawingCopyWith<$Res> {
  _$SpinnerDrawingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? top = null,
    Object? left = null,
    Object? scale = null,
    Object? colorHex = freezed,
    Object? animationTimingFunction = null,
    Object? spinsPerSecond = null,
  }) {
    return _then(_value.copyWith(
      top: null == top
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as int,
      left: null == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as int,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      colorHex: freezed == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as int?,
      animationTimingFunction: null == animationTimingFunction
          ? _value.animationTimingFunction
          : animationTimingFunction // ignore: cast_nullable_to_non_nullable
              as AnimationTimingFunction,
      spinsPerSecond: null == spinsPerSecond
          ? _value.spinsPerSecond
          : spinsPerSecond // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpinnerDrawingImplCopyWith<$Res>
    implements $SpinnerDrawingCopyWith<$Res> {
  factory _$$SpinnerDrawingImplCopyWith(_$SpinnerDrawingImpl value,
          $Res Function(_$SpinnerDrawingImpl) then) =
      __$$SpinnerDrawingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int top,
      int left,
      double scale,
      int? colorHex,
      AnimationTimingFunction animationTimingFunction,
      double spinsPerSecond});
}

/// @nodoc
class __$$SpinnerDrawingImplCopyWithImpl<$Res>
    extends _$SpinnerDrawingCopyWithImpl<$Res, _$SpinnerDrawingImpl>
    implements _$$SpinnerDrawingImplCopyWith<$Res> {
  __$$SpinnerDrawingImplCopyWithImpl(
      _$SpinnerDrawingImpl _value, $Res Function(_$SpinnerDrawingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? top = null,
    Object? left = null,
    Object? scale = null,
    Object? colorHex = freezed,
    Object? animationTimingFunction = null,
    Object? spinsPerSecond = null,
  }) {
    return _then(_$SpinnerDrawingImpl(
      top: null == top
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as int,
      left: null == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as int,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      colorHex: freezed == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as int?,
      animationTimingFunction: null == animationTimingFunction
          ? _value.animationTimingFunction
          : animationTimingFunction // ignore: cast_nullable_to_non_nullable
              as AnimationTimingFunction,
      spinsPerSecond: null == spinsPerSecond
          ? _value.spinsPerSecond
          : spinsPerSecond // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$SpinnerDrawingImpl extends _SpinnerDrawing {
  const _$SpinnerDrawingImpl(
      {this.top = 0,
      this.left = 0,
      this.scale = 1.0,
      this.colorHex,
      this.animationTimingFunction = AnimationTimingFunction.linear,
      this.spinsPerSecond = 1.0})
      : super._();

  @override
  @JsonKey()
  final int top;
  @override
  @JsonKey()
  final int left;

  /// The scale of the image.
  @override
  @JsonKey()
  final double scale;

  /// The fill color. If null, the image colors will be preserved.
  @override
  final int? colorHex;

  /// The curve applied while spinning.
  @override
  @JsonKey()
  final AnimationTimingFunction animationTimingFunction;

  /// How many rotations per second.
  @override
  @JsonKey()
  final double spinsPerSecond;

  @override
  String toString() {
    return 'SpinnerDrawing(top: $top, left: $left, scale: $scale, colorHex: $colorHex, animationTimingFunction: $animationTimingFunction, spinsPerSecond: $spinsPerSecond)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpinnerDrawingImpl &&
            (identical(other.top, top) || other.top == top) &&
            (identical(other.left, left) || other.left == left) &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.colorHex, colorHex) ||
                other.colorHex == colorHex) &&
            (identical(
                    other.animationTimingFunction, animationTimingFunction) ||
                other.animationTimingFunction == animationTimingFunction) &&
            (identical(other.spinsPerSecond, spinsPerSecond) ||
                other.spinsPerSecond == spinsPerSecond));
  }

  @override
  int get hashCode => Object.hash(runtimeType, top, left, scale, colorHex,
      animationTimingFunction, spinsPerSecond);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpinnerDrawingImplCopyWith<_$SpinnerDrawingImpl> get copyWith =>
      __$$SpinnerDrawingImplCopyWithImpl<_$SpinnerDrawingImpl>(
          this, _$identity);
}

abstract class _SpinnerDrawing extends SpinnerDrawing {
  const factory _SpinnerDrawing(
      {final int top,
      final int left,
      final double scale,
      final int? colorHex,
      final AnimationTimingFunction animationTimingFunction,
      final double spinsPerSecond}) = _$SpinnerDrawingImpl;
  const _SpinnerDrawing._() : super._();

  @override
  int get top;
  @override
  int get left;
  @override

  /// The scale of the image.
  double get scale;
  @override

  /// The fill color. If null, the image colors will be preserved.
  int? get colorHex;
  @override

  /// The curve applied while spinning.
  AnimationTimingFunction get animationTimingFunction;
  @override

  /// How many rotations per second.
  double get spinsPerSecond;
  @override
  @JsonKey(ignore: true)
  _$$SpinnerDrawingImplCopyWith<_$SpinnerDrawingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
