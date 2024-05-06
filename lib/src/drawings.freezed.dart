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

GYWDrawing _$GYWDrawingFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'TextDrawing':
      return TextDrawing.fromJson(json);
    case 'IconDrawing':
      return IconDrawing.fromJson(json);
    case 'RectangleDrawing':
      return RectangleDrawing.fromJson(json);
    case 'SpinnerDrawing':
      return SpinnerDrawing.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'GYWDrawing',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$GYWDrawing {
  /// The distance (in pixels) from the top of the screen
  int get top => throw _privateConstructorUsedError;

  /// The distance (in pixels) from the left side of the screen
  int get left => throw _privateConstructorUsedError;

  /// The color of the text.
  int? get colorHex => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int top,
            int left,
            String text,
            @GYWFontJsonConverter() GYWFont? font,
            int? size,
            int colorHex,
            int? maxWidth,
            int? maxLines)
        textDrawing,
    required TResult Function(int top, int left,
            @GYWIconJsonConverter() GYWIcon icon, int colorHex, double scale)
        iconDrawing,
    required TResult Function(
            int top, int left, int width, int height, int? colorHex)
        rectangleDrawing,
    required TResult Function(
            int top,
            int left,
            double scale,
            int? colorHex,
            AnimationTimingFunction animationTimingFunction,
            double spinsPerSecond)
        spinnerDrawing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int top,
            int left,
            String text,
            @GYWFontJsonConverter() GYWFont? font,
            int? size,
            int colorHex,
            int? maxWidth,
            int? maxLines)?
        textDrawing,
    TResult? Function(int top, int left, @GYWIconJsonConverter() GYWIcon icon,
            int colorHex, double scale)?
        iconDrawing,
    TResult? Function(int top, int left, int width, int height, int? colorHex)?
        rectangleDrawing,
    TResult? Function(
            int top,
            int left,
            double scale,
            int? colorHex,
            AnimationTimingFunction animationTimingFunction,
            double spinsPerSecond)?
        spinnerDrawing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int top,
            int left,
            String text,
            @GYWFontJsonConverter() GYWFont? font,
            int? size,
            int colorHex,
            int? maxWidth,
            int? maxLines)?
        textDrawing,
    TResult Function(int top, int left, @GYWIconJsonConverter() GYWIcon icon,
            int colorHex, double scale)?
        iconDrawing,
    TResult Function(int top, int left, int width, int height, int? colorHex)?
        rectangleDrawing,
    TResult Function(
            int top,
            int left,
            double scale,
            int? colorHex,
            AnimationTimingFunction animationTimingFunction,
            double spinsPerSecond)?
        spinnerDrawing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextDrawing value) textDrawing,
    required TResult Function(IconDrawing value) iconDrawing,
    required TResult Function(RectangleDrawing value) rectangleDrawing,
    required TResult Function(SpinnerDrawing value) spinnerDrawing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextDrawing value)? textDrawing,
    TResult? Function(IconDrawing value)? iconDrawing,
    TResult? Function(RectangleDrawing value)? rectangleDrawing,
    TResult? Function(SpinnerDrawing value)? spinnerDrawing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextDrawing value)? textDrawing,
    TResult Function(IconDrawing value)? iconDrawing,
    TResult Function(RectangleDrawing value)? rectangleDrawing,
    TResult Function(SpinnerDrawing value)? spinnerDrawing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GYWDrawingCopyWith<GYWDrawing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GYWDrawingCopyWith<$Res> {
  factory $GYWDrawingCopyWith(
          GYWDrawing value, $Res Function(GYWDrawing) then) =
      _$GYWDrawingCopyWithImpl<$Res, GYWDrawing>;
  @useResult
  $Res call({int top, int left, int colorHex});
}

/// @nodoc
class _$GYWDrawingCopyWithImpl<$Res, $Val extends GYWDrawing>
    implements $GYWDrawingCopyWith<$Res> {
  _$GYWDrawingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? top = null,
    Object? left = null,
    Object? colorHex = null,
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
      colorHex: null == colorHex
          ? _value.colorHex!
          : colorHex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextDrawingImplCopyWith<$Res>
    implements $GYWDrawingCopyWith<$Res> {
  factory _$$TextDrawingImplCopyWith(
          _$TextDrawingImpl value, $Res Function(_$TextDrawingImpl) then) =
      __$$TextDrawingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int top,
      int left,
      String text,
      @GYWFontJsonConverter() GYWFont? font,
      int? size,
      int colorHex,
      int? maxWidth,
      int? maxLines});
}

/// @nodoc
class __$$TextDrawingImplCopyWithImpl<$Res>
    extends _$GYWDrawingCopyWithImpl<$Res, _$TextDrawingImpl>
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
@JsonSerializable()
class _$TextDrawingImpl extends TextDrawing {
  const _$TextDrawingImpl(
      {this.top = 0,
      this.left = 0,
      required this.text,
      @GYWFontJsonConverter() this.font,
      this.size,
      this.colorHex = 0xFF000000,
      this.maxWidth,
      this.maxLines,
      final String? $type})
      : $type = $type ?? 'TextDrawing',
        super._();

  factory _$TextDrawingImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextDrawingImplFromJson(json);

  /// The distance (in pixels) from the top of the screen
  @override
  @JsonKey()
  final int top;

  /// The distance (in pixels) from the left side of the screen
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
  @GYWFontJsonConverter()
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

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GYWDrawing.textDrawing(top: $top, left: $left, text: $text, font: $font, size: $size, colorHex: $colorHex, maxWidth: $maxWidth, maxLines: $maxLines)';
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, top, left, text, font, size, colorHex, maxWidth, maxLines);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextDrawingImplCopyWith<_$TextDrawingImpl> get copyWith =>
      __$$TextDrawingImplCopyWithImpl<_$TextDrawingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int top,
            int left,
            String text,
            @GYWFontJsonConverter() GYWFont? font,
            int? size,
            int colorHex,
            int? maxWidth,
            int? maxLines)
        textDrawing,
    required TResult Function(int top, int left,
            @GYWIconJsonConverter() GYWIcon icon, int colorHex, double scale)
        iconDrawing,
    required TResult Function(
            int top, int left, int width, int height, int? colorHex)
        rectangleDrawing,
    required TResult Function(
            int top,
            int left,
            double scale,
            int? colorHex,
            AnimationTimingFunction animationTimingFunction,
            double spinsPerSecond)
        spinnerDrawing,
  }) {
    return textDrawing(
        top, left, text, font, size, colorHex, maxWidth, maxLines);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int top,
            int left,
            String text,
            @GYWFontJsonConverter() GYWFont? font,
            int? size,
            int colorHex,
            int? maxWidth,
            int? maxLines)?
        textDrawing,
    TResult? Function(int top, int left, @GYWIconJsonConverter() GYWIcon icon,
            int colorHex, double scale)?
        iconDrawing,
    TResult? Function(int top, int left, int width, int height, int? colorHex)?
        rectangleDrawing,
    TResult? Function(
            int top,
            int left,
            double scale,
            int? colorHex,
            AnimationTimingFunction animationTimingFunction,
            double spinsPerSecond)?
        spinnerDrawing,
  }) {
    return textDrawing?.call(
        top, left, text, font, size, colorHex, maxWidth, maxLines);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int top,
            int left,
            String text,
            @GYWFontJsonConverter() GYWFont? font,
            int? size,
            int colorHex,
            int? maxWidth,
            int? maxLines)?
        textDrawing,
    TResult Function(int top, int left, @GYWIconJsonConverter() GYWIcon icon,
            int colorHex, double scale)?
        iconDrawing,
    TResult Function(int top, int left, int width, int height, int? colorHex)?
        rectangleDrawing,
    TResult Function(
            int top,
            int left,
            double scale,
            int? colorHex,
            AnimationTimingFunction animationTimingFunction,
            double spinsPerSecond)?
        spinnerDrawing,
    required TResult orElse(),
  }) {
    if (textDrawing != null) {
      return textDrawing(
          top, left, text, font, size, colorHex, maxWidth, maxLines);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextDrawing value) textDrawing,
    required TResult Function(IconDrawing value) iconDrawing,
    required TResult Function(RectangleDrawing value) rectangleDrawing,
    required TResult Function(SpinnerDrawing value) spinnerDrawing,
  }) {
    return textDrawing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextDrawing value)? textDrawing,
    TResult? Function(IconDrawing value)? iconDrawing,
    TResult? Function(RectangleDrawing value)? rectangleDrawing,
    TResult? Function(SpinnerDrawing value)? spinnerDrawing,
  }) {
    return textDrawing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextDrawing value)? textDrawing,
    TResult Function(IconDrawing value)? iconDrawing,
    TResult Function(RectangleDrawing value)? rectangleDrawing,
    TResult Function(SpinnerDrawing value)? spinnerDrawing,
    required TResult orElse(),
  }) {
    if (textDrawing != null) {
      return textDrawing(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TextDrawingImplToJson(
      this,
    );
  }
}

abstract class TextDrawing extends GYWDrawing {
  const factory TextDrawing(
      {final int top,
      final int left,
      required final String text,
      @GYWFontJsonConverter() final GYWFont? font,
      final int? size,
      final int colorHex,
      final int? maxWidth,
      final int? maxLines}) = _$TextDrawingImpl;
  const TextDrawing._() : super._();

  factory TextDrawing.fromJson(Map<String, dynamic> json) =
      _$TextDrawingImpl.fromJson;

  @override

  /// The distance (in pixels) from the top of the screen
  int get top;
  @override

  /// The distance (in pixels) from the left side of the screen
  int get left;

  /// The text that must be displayed
  String get text;

  /// The [GYWFont] to use
  ///
  /// If no font is given, it uses the most recent one
  @GYWFontJsonConverter()
  GYWFont? get font;

  /// The text size. Overrides the font size.
  int? get size;
  @override

  /// The color of the text.
  int get colorHex;

  /// The maximum width (in pixels) of the text.
  ///
  /// It will be wrapped on multiple lines if it is too long.
  /// Null disables the limit.
  int? get maxWidth;

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
abstract class _$$IconDrawingImplCopyWith<$Res>
    implements $GYWDrawingCopyWith<$Res> {
  factory _$$IconDrawingImplCopyWith(
          _$IconDrawingImpl value, $Res Function(_$IconDrawingImpl) then) =
      __$$IconDrawingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int top,
      int left,
      @GYWIconJsonConverter() GYWIcon icon,
      int colorHex,
      double scale});
}

/// @nodoc
class __$$IconDrawingImplCopyWithImpl<$Res>
    extends _$GYWDrawingCopyWithImpl<$Res, _$IconDrawingImpl>
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
@JsonSerializable()
class _$IconDrawingImpl extends IconDrawing {
  const _$IconDrawingImpl(
      {this.top = 0,
      this.left = 0,
      @GYWIconJsonConverter() required this.icon,
      this.colorHex = 0xFF000000,
      this.scale = 1.0,
      final String? $type})
      : $type = $type ?? 'IconDrawing',
        super._();

  factory _$IconDrawingImpl.fromJson(Map<String, dynamic> json) =>
      _$$IconDrawingImplFromJson(json);

  /// The distance (in pixels) from the top of the screen
  @override
  @JsonKey()
  final int top;

  /// The distance (in pixels) from the left side of the screen
  @override
  @JsonKey()
  final int left;

  /// The displayed [GYWIcon]
  @override
  @GYWIconJsonConverter()
  final GYWIcon icon;

  /// Hexadecimal code of the icon fill color
  @override
  @JsonKey()
  final int colorHex;

  /// The icon scaling factor.
  @override
  @JsonKey()
  final double scale;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GYWDrawing.iconDrawing(top: $top, left: $left, icon: $icon, colorHex: $colorHex, scale: $scale)';
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

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, top, left, icon, colorHex, scale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IconDrawingImplCopyWith<_$IconDrawingImpl> get copyWith =>
      __$$IconDrawingImplCopyWithImpl<_$IconDrawingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int top,
            int left,
            String text,
            @GYWFontJsonConverter() GYWFont? font,
            int? size,
            int colorHex,
            int? maxWidth,
            int? maxLines)
        textDrawing,
    required TResult Function(int top, int left,
            @GYWIconJsonConverter() GYWIcon icon, int colorHex, double scale)
        iconDrawing,
    required TResult Function(
            int top, int left, int width, int height, int? colorHex)
        rectangleDrawing,
    required TResult Function(
            int top,
            int left,
            double scale,
            int? colorHex,
            AnimationTimingFunction animationTimingFunction,
            double spinsPerSecond)
        spinnerDrawing,
  }) {
    return iconDrawing(top, left, icon, colorHex, scale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int top,
            int left,
            String text,
            @GYWFontJsonConverter() GYWFont? font,
            int? size,
            int colorHex,
            int? maxWidth,
            int? maxLines)?
        textDrawing,
    TResult? Function(int top, int left, @GYWIconJsonConverter() GYWIcon icon,
            int colorHex, double scale)?
        iconDrawing,
    TResult? Function(int top, int left, int width, int height, int? colorHex)?
        rectangleDrawing,
    TResult? Function(
            int top,
            int left,
            double scale,
            int? colorHex,
            AnimationTimingFunction animationTimingFunction,
            double spinsPerSecond)?
        spinnerDrawing,
  }) {
    return iconDrawing?.call(top, left, icon, colorHex, scale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int top,
            int left,
            String text,
            @GYWFontJsonConverter() GYWFont? font,
            int? size,
            int colorHex,
            int? maxWidth,
            int? maxLines)?
        textDrawing,
    TResult Function(int top, int left, @GYWIconJsonConverter() GYWIcon icon,
            int colorHex, double scale)?
        iconDrawing,
    TResult Function(int top, int left, int width, int height, int? colorHex)?
        rectangleDrawing,
    TResult Function(
            int top,
            int left,
            double scale,
            int? colorHex,
            AnimationTimingFunction animationTimingFunction,
            double spinsPerSecond)?
        spinnerDrawing,
    required TResult orElse(),
  }) {
    if (iconDrawing != null) {
      return iconDrawing(top, left, icon, colorHex, scale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextDrawing value) textDrawing,
    required TResult Function(IconDrawing value) iconDrawing,
    required TResult Function(RectangleDrawing value) rectangleDrawing,
    required TResult Function(SpinnerDrawing value) spinnerDrawing,
  }) {
    return iconDrawing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextDrawing value)? textDrawing,
    TResult? Function(IconDrawing value)? iconDrawing,
    TResult? Function(RectangleDrawing value)? rectangleDrawing,
    TResult? Function(SpinnerDrawing value)? spinnerDrawing,
  }) {
    return iconDrawing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextDrawing value)? textDrawing,
    TResult Function(IconDrawing value)? iconDrawing,
    TResult Function(RectangleDrawing value)? rectangleDrawing,
    TResult Function(SpinnerDrawing value)? spinnerDrawing,
    required TResult orElse(),
  }) {
    if (iconDrawing != null) {
      return iconDrawing(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$IconDrawingImplToJson(
      this,
    );
  }
}

abstract class IconDrawing extends GYWDrawing {
  const factory IconDrawing(
      {final int top,
      final int left,
      @GYWIconJsonConverter() required final GYWIcon icon,
      final int colorHex,
      final double scale}) = _$IconDrawingImpl;
  const IconDrawing._() : super._();

  factory IconDrawing.fromJson(Map<String, dynamic> json) =
      _$IconDrawingImpl.fromJson;

  @override

  /// The distance (in pixels) from the top of the screen
  int get top;
  @override

  /// The distance (in pixels) from the left side of the screen
  int get left;

  /// The displayed [GYWIcon]
  @GYWIconJsonConverter()
  GYWIcon get icon;
  @override

  /// Hexadecimal code of the icon fill color
  int get colorHex;

  /// The icon scaling factor.
  double get scale;
  @override
  @JsonKey(ignore: true)
  _$$IconDrawingImplCopyWith<_$IconDrawingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RectangleDrawingImplCopyWith<$Res>
    implements $GYWDrawingCopyWith<$Res> {
  factory _$$RectangleDrawingImplCopyWith(_$RectangleDrawingImpl value,
          $Res Function(_$RectangleDrawingImpl) then) =
      __$$RectangleDrawingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int top, int left, int width, int height, int? colorHex});
}

/// @nodoc
class __$$RectangleDrawingImplCopyWithImpl<$Res>
    extends _$GYWDrawingCopyWithImpl<$Res, _$RectangleDrawingImpl>
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
@JsonSerializable()
class _$RectangleDrawingImpl extends RectangleDrawing {
  const _$RectangleDrawingImpl(
      {this.top = 0,
      this.left = 0,
      required this.width,
      required this.height,
      this.colorHex,
      final String? $type})
      : $type = $type ?? 'RectangleDrawing',
        super._();

  factory _$RectangleDrawingImpl.fromJson(Map<String, dynamic> json) =>
      _$$RectangleDrawingImplFromJson(json);

  /// The distance (in pixels) from the top of the screen
  @override
  @JsonKey()
  final int top;

  /// The distance (in pixels) from the left side of the screen
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

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GYWDrawing.rectangleDrawing(top: $top, left: $left, width: $width, height: $height, colorHex: $colorHex)';
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

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, top, left, width, height, colorHex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RectangleDrawingImplCopyWith<_$RectangleDrawingImpl> get copyWith =>
      __$$RectangleDrawingImplCopyWithImpl<_$RectangleDrawingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int top,
            int left,
            String text,
            @GYWFontJsonConverter() GYWFont? font,
            int? size,
            int colorHex,
            int? maxWidth,
            int? maxLines)
        textDrawing,
    required TResult Function(int top, int left,
            @GYWIconJsonConverter() GYWIcon icon, int colorHex, double scale)
        iconDrawing,
    required TResult Function(
            int top, int left, int width, int height, int? colorHex)
        rectangleDrawing,
    required TResult Function(
            int top,
            int left,
            double scale,
            int? colorHex,
            AnimationTimingFunction animationTimingFunction,
            double spinsPerSecond)
        spinnerDrawing,
  }) {
    return rectangleDrawing(top, left, width, height, colorHex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int top,
            int left,
            String text,
            @GYWFontJsonConverter() GYWFont? font,
            int? size,
            int colorHex,
            int? maxWidth,
            int? maxLines)?
        textDrawing,
    TResult? Function(int top, int left, @GYWIconJsonConverter() GYWIcon icon,
            int colorHex, double scale)?
        iconDrawing,
    TResult? Function(int top, int left, int width, int height, int? colorHex)?
        rectangleDrawing,
    TResult? Function(
            int top,
            int left,
            double scale,
            int? colorHex,
            AnimationTimingFunction animationTimingFunction,
            double spinsPerSecond)?
        spinnerDrawing,
  }) {
    return rectangleDrawing?.call(top, left, width, height, colorHex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int top,
            int left,
            String text,
            @GYWFontJsonConverter() GYWFont? font,
            int? size,
            int colorHex,
            int? maxWidth,
            int? maxLines)?
        textDrawing,
    TResult Function(int top, int left, @GYWIconJsonConverter() GYWIcon icon,
            int colorHex, double scale)?
        iconDrawing,
    TResult Function(int top, int left, int width, int height, int? colorHex)?
        rectangleDrawing,
    TResult Function(
            int top,
            int left,
            double scale,
            int? colorHex,
            AnimationTimingFunction animationTimingFunction,
            double spinsPerSecond)?
        spinnerDrawing,
    required TResult orElse(),
  }) {
    if (rectangleDrawing != null) {
      return rectangleDrawing(top, left, width, height, colorHex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextDrawing value) textDrawing,
    required TResult Function(IconDrawing value) iconDrawing,
    required TResult Function(RectangleDrawing value) rectangleDrawing,
    required TResult Function(SpinnerDrawing value) spinnerDrawing,
  }) {
    return rectangleDrawing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextDrawing value)? textDrawing,
    TResult? Function(IconDrawing value)? iconDrawing,
    TResult? Function(RectangleDrawing value)? rectangleDrawing,
    TResult? Function(SpinnerDrawing value)? spinnerDrawing,
  }) {
    return rectangleDrawing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextDrawing value)? textDrawing,
    TResult Function(IconDrawing value)? iconDrawing,
    TResult Function(RectangleDrawing value)? rectangleDrawing,
    TResult Function(SpinnerDrawing value)? spinnerDrawing,
    required TResult orElse(),
  }) {
    if (rectangleDrawing != null) {
      return rectangleDrawing(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RectangleDrawingImplToJson(
      this,
    );
  }
}

abstract class RectangleDrawing extends GYWDrawing {
  const factory RectangleDrawing(
      {final int top,
      final int left,
      required final int width,
      required final int height,
      final int? colorHex}) = _$RectangleDrawingImpl;
  const RectangleDrawing._() : super._();

  factory RectangleDrawing.fromJson(Map<String, dynamic> json) =
      _$RectangleDrawingImpl.fromJson;

  @override

  /// The distance (in pixels) from the top of the screen
  int get top;
  @override

  /// The distance (in pixels) from the left side of the screen
  int get left;

  /// The rectangle width.
  int get width;

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
abstract class _$$SpinnerDrawingImplCopyWith<$Res>
    implements $GYWDrawingCopyWith<$Res> {
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
    extends _$GYWDrawingCopyWithImpl<$Res, _$SpinnerDrawingImpl>
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
@JsonSerializable()
class _$SpinnerDrawingImpl extends SpinnerDrawing {
  const _$SpinnerDrawingImpl(
      {this.top = 0,
      this.left = 0,
      this.scale = 1.0,
      this.colorHex,
      this.animationTimingFunction = AnimationTimingFunction.linear,
      this.spinsPerSecond = 1.0,
      final String? $type})
      : $type = $type ?? 'SpinnerDrawing',
        super._();

  factory _$SpinnerDrawingImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpinnerDrawingImplFromJson(json);

  /// The distance (in pixels) from the top of the screen
  @override
  @JsonKey()
  final int top;

  /// The distance (in pixels) from the left side of the screen
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

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GYWDrawing.spinnerDrawing(top: $top, left: $left, scale: $scale, colorHex: $colorHex, animationTimingFunction: $animationTimingFunction, spinsPerSecond: $spinsPerSecond)';
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, top, left, scale, colorHex,
      animationTimingFunction, spinsPerSecond);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpinnerDrawingImplCopyWith<_$SpinnerDrawingImpl> get copyWith =>
      __$$SpinnerDrawingImplCopyWithImpl<_$SpinnerDrawingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int top,
            int left,
            String text,
            @GYWFontJsonConverter() GYWFont? font,
            int? size,
            int colorHex,
            int? maxWidth,
            int? maxLines)
        textDrawing,
    required TResult Function(int top, int left,
            @GYWIconJsonConverter() GYWIcon icon, int colorHex, double scale)
        iconDrawing,
    required TResult Function(
            int top, int left, int width, int height, int? colorHex)
        rectangleDrawing,
    required TResult Function(
            int top,
            int left,
            double scale,
            int? colorHex,
            AnimationTimingFunction animationTimingFunction,
            double spinsPerSecond)
        spinnerDrawing,
  }) {
    return spinnerDrawing(
        top, left, scale, colorHex, animationTimingFunction, spinsPerSecond);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int top,
            int left,
            String text,
            @GYWFontJsonConverter() GYWFont? font,
            int? size,
            int colorHex,
            int? maxWidth,
            int? maxLines)?
        textDrawing,
    TResult? Function(int top, int left, @GYWIconJsonConverter() GYWIcon icon,
            int colorHex, double scale)?
        iconDrawing,
    TResult? Function(int top, int left, int width, int height, int? colorHex)?
        rectangleDrawing,
    TResult? Function(
            int top,
            int left,
            double scale,
            int? colorHex,
            AnimationTimingFunction animationTimingFunction,
            double spinsPerSecond)?
        spinnerDrawing,
  }) {
    return spinnerDrawing?.call(
        top, left, scale, colorHex, animationTimingFunction, spinsPerSecond);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int top,
            int left,
            String text,
            @GYWFontJsonConverter() GYWFont? font,
            int? size,
            int colorHex,
            int? maxWidth,
            int? maxLines)?
        textDrawing,
    TResult Function(int top, int left, @GYWIconJsonConverter() GYWIcon icon,
            int colorHex, double scale)?
        iconDrawing,
    TResult Function(int top, int left, int width, int height, int? colorHex)?
        rectangleDrawing,
    TResult Function(
            int top,
            int left,
            double scale,
            int? colorHex,
            AnimationTimingFunction animationTimingFunction,
            double spinsPerSecond)?
        spinnerDrawing,
    required TResult orElse(),
  }) {
    if (spinnerDrawing != null) {
      return spinnerDrawing(
          top, left, scale, colorHex, animationTimingFunction, spinsPerSecond);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextDrawing value) textDrawing,
    required TResult Function(IconDrawing value) iconDrawing,
    required TResult Function(RectangleDrawing value) rectangleDrawing,
    required TResult Function(SpinnerDrawing value) spinnerDrawing,
  }) {
    return spinnerDrawing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextDrawing value)? textDrawing,
    TResult? Function(IconDrawing value)? iconDrawing,
    TResult? Function(RectangleDrawing value)? rectangleDrawing,
    TResult? Function(SpinnerDrawing value)? spinnerDrawing,
  }) {
    return spinnerDrawing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextDrawing value)? textDrawing,
    TResult Function(IconDrawing value)? iconDrawing,
    TResult Function(RectangleDrawing value)? rectangleDrawing,
    TResult Function(SpinnerDrawing value)? spinnerDrawing,
    required TResult orElse(),
  }) {
    if (spinnerDrawing != null) {
      return spinnerDrawing(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SpinnerDrawingImplToJson(
      this,
    );
  }
}

abstract class SpinnerDrawing extends GYWDrawing {
  const factory SpinnerDrawing(
      {final int top,
      final int left,
      final double scale,
      final int? colorHex,
      final AnimationTimingFunction animationTimingFunction,
      final double spinsPerSecond}) = _$SpinnerDrawingImpl;
  const SpinnerDrawing._() : super._();

  factory SpinnerDrawing.fromJson(Map<String, dynamic> json) =
      _$SpinnerDrawingImpl.fromJson;

  @override

  /// The distance (in pixels) from the top of the screen
  int get top;
  @override

  /// The distance (in pixels) from the left side of the screen
  int get left;

  /// The scale of the image.
  double get scale;
  @override

  /// The fill color. If null, the image colors will be preserved.
  int? get colorHex;

  /// The curve applied while spinning.
  AnimationTimingFunction get animationTimingFunction;

  /// How many rotations per second.
  double get spinsPerSecond;
  @override
  @JsonKey(ignore: true)
  _$$SpinnerDrawingImplCopyWith<_$SpinnerDrawingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
