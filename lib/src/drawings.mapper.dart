// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'drawings.dart';

class AnimationTimingFunctionMapper
    extends EnumMapper<AnimationTimingFunction> {
  AnimationTimingFunctionMapper._();

  static AnimationTimingFunctionMapper? _instance;
  static AnimationTimingFunctionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = AnimationTimingFunctionMapper._());
    }
    return _instance!;
  }

  static AnimationTimingFunction fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AnimationTimingFunction decode(dynamic value) {
    switch (value) {
      case 'linear':
        return AnimationTimingFunction.linear;
      case 'ease_in':
        return AnimationTimingFunction.ease_in;
      case 'ease_out':
        return AnimationTimingFunction.ease_out;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AnimationTimingFunction self) {
    switch (self) {
      case AnimationTimingFunction.linear:
        return 'linear';
      case AnimationTimingFunction.ease_in:
        return 'ease_in';
      case AnimationTimingFunction.ease_out:
        return 'ease_out';
    }
  }
}

extension AnimationTimingFunctionMapperExtension on AnimationTimingFunction {
  String toValue() {
    AnimationTimingFunctionMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AnimationTimingFunction>(this)
        as String;
  }
}

class GYWDrawingMapper extends ClassMapperBase<GYWDrawing> {
  GYWDrawingMapper._();

  static GYWDrawingMapper? _instance;
  static GYWDrawingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GYWDrawingMapper._());
      MapperContainer.globals.useAll([GYWIconMapper(), GYWFontMapper()]);
      TextDrawingMapper.ensureInitialized();
      IconDrawingMapper.ensureInitialized();
      RectangleDrawingMapper.ensureInitialized();
      SpinnerDrawingMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GYWDrawing';

  static int _$top(GYWDrawing v) => v.top;
  static const Field<GYWDrawing, int> _f$top =
      Field('top', _$top, opt: true, def: 0);
  static int _$left(GYWDrawing v) => v.left;
  static const Field<GYWDrawing, int> _f$left =
      Field('left', _$left, opt: true, def: 0);

  @override
  final MappableFields<GYWDrawing> fields = const {
    #top: _f$top,
    #left: _f$left,
  };

  static GYWDrawing _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'GYWDrawing', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static GYWDrawing fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GYWDrawing>(map);
  }

  static GYWDrawing fromJson(String json) {
    return ensureInitialized().decodeJson<GYWDrawing>(json);
  }
}

mixin GYWDrawingMappable {
  String toJson();
  Map<String, dynamic> toMap();
  GYWDrawingCopyWith<GYWDrawing, GYWDrawing, GYWDrawing> get copyWith;
}

abstract class GYWDrawingCopyWith<$R, $In extends GYWDrawing, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? top, int? left});
  GYWDrawingCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class TextDrawingMapper extends SubClassMapperBase<TextDrawing> {
  TextDrawingMapper._();

  static TextDrawingMapper? _instance;
  static TextDrawingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TextDrawingMapper._());
      GYWDrawingMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'TextDrawing';

  static String _$text(TextDrawing v) => v.text;
  static const Field<TextDrawing, String> _f$text = Field('text', _$text);
  static GYWFont _$font(TextDrawing v) => v.font;
  static const Field<TextDrawing, GYWFont> _f$font =
      Field('font', _$font, opt: true, def: robotoMonoFont);
  static int _$size(TextDrawing v) => v.size;
  static const Field<TextDrawing, int> _f$size =
      Field('size', _$size, opt: true, def: 24);
  static int _$colorHex(TextDrawing v) => v.colorHex;
  static const Field<TextDrawing, int> _f$colorHex =
      Field('colorHex', _$colorHex, key: 'color', opt: true, def: 0xFF000000);
  static int? _$maxWidth(TextDrawing v) => v.maxWidth;
  static const Field<TextDrawing, int> _f$maxWidth =
      Field('maxWidth', _$maxWidth, key: 'max_width', opt: true);
  static int? _$maxLines(TextDrawing v) => v.maxLines;
  static const Field<TextDrawing, int> _f$maxLines =
      Field('maxLines', _$maxLines, key: 'max_lines', opt: true, def: 1);
  static int _$left(TextDrawing v) => v.left;
  static const Field<TextDrawing, int> _f$left =
      Field('left', _$left, opt: true, def: 0);
  static int _$top(TextDrawing v) => v.top;
  static const Field<TextDrawing, int> _f$top =
      Field('top', _$top, opt: true, def: 0);

  @override
  final MappableFields<TextDrawing> fields = const {
    #text: _f$text,
    #font: _f$font,
    #size: _f$size,
    #colorHex: _f$colorHex,
    #maxWidth: _f$maxWidth,
    #maxLines: _f$maxLines,
    #left: _f$left,
    #top: _f$top,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'TextDrawing';
  @override
  late final ClassMapperBase superMapper = GYWDrawingMapper.ensureInitialized();

  static TextDrawing _instantiate(DecodingData data) {
    return TextDrawing(
        text: data.dec(_f$text),
        font: data.dec(_f$font),
        size: data.dec(_f$size),
        colorHex: data.dec(_f$colorHex),
        maxWidth: data.dec(_f$maxWidth),
        maxLines: data.dec(_f$maxLines),
        left: data.dec(_f$left),
        top: data.dec(_f$top));
  }

  @override
  final Function instantiate = _instantiate;

  static TextDrawing fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TextDrawing>(map);
  }

  static TextDrawing fromJson(String json) {
    return ensureInitialized().decodeJson<TextDrawing>(json);
  }
}

mixin TextDrawingMappable {
  String toJson() {
    return TextDrawingMapper.ensureInitialized()
        .encodeJson<TextDrawing>(this as TextDrawing);
  }

  Map<String, dynamic> toMap() {
    return TextDrawingMapper.ensureInitialized()
        .encodeMap<TextDrawing>(this as TextDrawing);
  }

  TextDrawingCopyWith<TextDrawing, TextDrawing, TextDrawing> get copyWith =>
      _TextDrawingCopyWithImpl(this as TextDrawing, $identity, $identity);
  @override
  String toString() {
    return TextDrawingMapper.ensureInitialized()
        .stringifyValue(this as TextDrawing);
  }

  @override
  bool operator ==(Object other) {
    return TextDrawingMapper.ensureInitialized()
        .equalsValue(this as TextDrawing, other);
  }

  @override
  int get hashCode {
    return TextDrawingMapper.ensureInitialized().hashValue(this as TextDrawing);
  }
}

extension TextDrawingValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TextDrawing, $Out> {
  TextDrawingCopyWith<$R, TextDrawing, $Out> get $asTextDrawing =>
      $base.as((v, t, t2) => _TextDrawingCopyWithImpl(v, t, t2));
}

abstract class TextDrawingCopyWith<$R, $In extends TextDrawing, $Out>
    implements GYWDrawingCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? text,
      GYWFont? font,
      int? size,
      int? colorHex,
      int? maxWidth,
      int? maxLines,
      int? left,
      int? top});
  TextDrawingCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TextDrawingCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TextDrawing, $Out>
    implements TextDrawingCopyWith<$R, TextDrawing, $Out> {
  _TextDrawingCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TextDrawing> $mapper =
      TextDrawingMapper.ensureInitialized();
  @override
  $R call(
          {String? text,
          GYWFont? font,
          int? size,
          int? colorHex,
          Object? maxWidth = $none,
          Object? maxLines = $none,
          int? left,
          int? top}) =>
      $apply(FieldCopyWithData({
        if (text != null) #text: text,
        if (font != null) #font: font,
        if (size != null) #size: size,
        if (colorHex != null) #colorHex: colorHex,
        if (maxWidth != $none) #maxWidth: maxWidth,
        if (maxLines != $none) #maxLines: maxLines,
        if (left != null) #left: left,
        if (top != null) #top: top
      }));
  @override
  TextDrawing $make(CopyWithData data) => TextDrawing(
      text: data.get(#text, or: $value.text),
      font: data.get(#font, or: $value.font),
      size: data.get(#size, or: $value.size),
      colorHex: data.get(#colorHex, or: $value.colorHex),
      maxWidth: data.get(#maxWidth, or: $value.maxWidth),
      maxLines: data.get(#maxLines, or: $value.maxLines),
      left: data.get(#left, or: $value.left),
      top: data.get(#top, or: $value.top));

  @override
  TextDrawingCopyWith<$R2, TextDrawing, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TextDrawingCopyWithImpl($value, $cast, t);
}

class IconDrawingMapper extends SubClassMapperBase<IconDrawing> {
  IconDrawingMapper._();

  static IconDrawingMapper? _instance;
  static IconDrawingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IconDrawingMapper._());
      GYWDrawingMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'IconDrawing';

  static GYWIcon _$icon(IconDrawing v) => v.icon;
  static const Field<IconDrawing, GYWIcon> _f$icon = Field('icon', _$icon);
  static int _$top(IconDrawing v) => v.top;
  static const Field<IconDrawing, int> _f$top =
      Field('top', _$top, opt: true, def: 0);
  static int _$left(IconDrawing v) => v.left;
  static const Field<IconDrawing, int> _f$left =
      Field('left', _$left, opt: true, def: 0);
  static int _$colorHex(IconDrawing v) => v.colorHex;
  static const Field<IconDrawing, int> _f$colorHex =
      Field('colorHex', _$colorHex, key: 'color', opt: true, def: 0xFF000000);
  static double _$scale(IconDrawing v) => v.scale;
  static const Field<IconDrawing, double> _f$scale =
      Field('scale', _$scale, opt: true, def: 1.0);

  @override
  final MappableFields<IconDrawing> fields = const {
    #icon: _f$icon,
    #top: _f$top,
    #left: _f$left,
    #colorHex: _f$colorHex,
    #scale: _f$scale,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'IconDrawing';
  @override
  late final ClassMapperBase superMapper = GYWDrawingMapper.ensureInitialized();

  static IconDrawing _instantiate(DecodingData data) {
    return IconDrawing(data.dec(_f$icon),
        top: data.dec(_f$top),
        left: data.dec(_f$left),
        colorHex: data.dec(_f$colorHex),
        scale: data.dec(_f$scale));
  }

  @override
  final Function instantiate = _instantiate;

  static IconDrawing fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IconDrawing>(map);
  }

  static IconDrawing fromJson(String json) {
    return ensureInitialized().decodeJson<IconDrawing>(json);
  }
}

mixin IconDrawingMappable {
  String toJson() {
    return IconDrawingMapper.ensureInitialized()
        .encodeJson<IconDrawing>(this as IconDrawing);
  }

  Map<String, dynamic> toMap() {
    return IconDrawingMapper.ensureInitialized()
        .encodeMap<IconDrawing>(this as IconDrawing);
  }

  IconDrawingCopyWith<IconDrawing, IconDrawing, IconDrawing> get copyWith =>
      _IconDrawingCopyWithImpl(this as IconDrawing, $identity, $identity);
  @override
  String toString() {
    return IconDrawingMapper.ensureInitialized()
        .stringifyValue(this as IconDrawing);
  }

  @override
  bool operator ==(Object other) {
    return IconDrawingMapper.ensureInitialized()
        .equalsValue(this as IconDrawing, other);
  }

  @override
  int get hashCode {
    return IconDrawingMapper.ensureInitialized().hashValue(this as IconDrawing);
  }
}

extension IconDrawingValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IconDrawing, $Out> {
  IconDrawingCopyWith<$R, IconDrawing, $Out> get $asIconDrawing =>
      $base.as((v, t, t2) => _IconDrawingCopyWithImpl(v, t, t2));
}

abstract class IconDrawingCopyWith<$R, $In extends IconDrawing, $Out>
    implements GYWDrawingCopyWith<$R, $In, $Out> {
  @override
  $R call({GYWIcon? icon, int? top, int? left, int? colorHex, double? scale});
  IconDrawingCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _IconDrawingCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IconDrawing, $Out>
    implements IconDrawingCopyWith<$R, IconDrawing, $Out> {
  _IconDrawingCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IconDrawing> $mapper =
      IconDrawingMapper.ensureInitialized();
  @override
  $R call({GYWIcon? icon, int? top, int? left, int? colorHex, double? scale}) =>
      $apply(FieldCopyWithData({
        if (icon != null) #icon: icon,
        if (top != null) #top: top,
        if (left != null) #left: left,
        if (colorHex != null) #colorHex: colorHex,
        if (scale != null) #scale: scale
      }));
  @override
  IconDrawing $make(CopyWithData data) =>
      IconDrawing(data.get(#icon, or: $value.icon),
          top: data.get(#top, or: $value.top),
          left: data.get(#left, or: $value.left),
          colorHex: data.get(#colorHex, or: $value.colorHex),
          scale: data.get(#scale, or: $value.scale));

  @override
  IconDrawingCopyWith<$R2, IconDrawing, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _IconDrawingCopyWithImpl($value, $cast, t);
}

class RectangleDrawingMapper extends SubClassMapperBase<RectangleDrawing> {
  RectangleDrawingMapper._();

  static RectangleDrawingMapper? _instance;
  static RectangleDrawingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RectangleDrawingMapper._());
      GYWDrawingMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'RectangleDrawing';

  static int _$left(RectangleDrawing v) => v.left;
  static const Field<RectangleDrawing, int> _f$left =
      Field('left', _$left, opt: true, def: 0);
  static int _$top(RectangleDrawing v) => v.top;
  static const Field<RectangleDrawing, int> _f$top =
      Field('top', _$top, opt: true, def: 0);
  static int _$width(RectangleDrawing v) => v.width;
  static const Field<RectangleDrawing, int> _f$width = Field('width', _$width);
  static int _$height(RectangleDrawing v) => v.height;
  static const Field<RectangleDrawing, int> _f$height =
      Field('height', _$height);
  static int? _$colorHex(RectangleDrawing v) => v.colorHex;
  static const Field<RectangleDrawing, int> _f$colorHex =
      Field('colorHex', _$colorHex, key: 'color', opt: true);

  @override
  final MappableFields<RectangleDrawing> fields = const {
    #left: _f$left,
    #top: _f$top,
    #width: _f$width,
    #height: _f$height,
    #colorHex: _f$colorHex,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'RectangleDrawing';
  @override
  late final ClassMapperBase superMapper = GYWDrawingMapper.ensureInitialized();

  static RectangleDrawing _instantiate(DecodingData data) {
    return RectangleDrawing(
        left: data.dec(_f$left),
        top: data.dec(_f$top),
        width: data.dec(_f$width),
        height: data.dec(_f$height),
        colorHex: data.dec(_f$colorHex));
  }

  @override
  final Function instantiate = _instantiate;

  static RectangleDrawing fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RectangleDrawing>(map);
  }

  static RectangleDrawing fromJson(String json) {
    return ensureInitialized().decodeJson<RectangleDrawing>(json);
  }
}

mixin RectangleDrawingMappable {
  String toJson() {
    return RectangleDrawingMapper.ensureInitialized()
        .encodeJson<RectangleDrawing>(this as RectangleDrawing);
  }

  Map<String, dynamic> toMap() {
    return RectangleDrawingMapper.ensureInitialized()
        .encodeMap<RectangleDrawing>(this as RectangleDrawing);
  }

  RectangleDrawingCopyWith<RectangleDrawing, RectangleDrawing, RectangleDrawing>
      get copyWith => _RectangleDrawingCopyWithImpl(
          this as RectangleDrawing, $identity, $identity);
  @override
  String toString() {
    return RectangleDrawingMapper.ensureInitialized()
        .stringifyValue(this as RectangleDrawing);
  }

  @override
  bool operator ==(Object other) {
    return RectangleDrawingMapper.ensureInitialized()
        .equalsValue(this as RectangleDrawing, other);
  }

  @override
  int get hashCode {
    return RectangleDrawingMapper.ensureInitialized()
        .hashValue(this as RectangleDrawing);
  }
}

extension RectangleDrawingValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RectangleDrawing, $Out> {
  RectangleDrawingCopyWith<$R, RectangleDrawing, $Out>
      get $asRectangleDrawing =>
          $base.as((v, t, t2) => _RectangleDrawingCopyWithImpl(v, t, t2));
}

abstract class RectangleDrawingCopyWith<$R, $In extends RectangleDrawing, $Out>
    implements GYWDrawingCopyWith<$R, $In, $Out> {
  @override
  $R call({int? left, int? top, int? width, int? height, int? colorHex});
  RectangleDrawingCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _RectangleDrawingCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RectangleDrawing, $Out>
    implements RectangleDrawingCopyWith<$R, RectangleDrawing, $Out> {
  _RectangleDrawingCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RectangleDrawing> $mapper =
      RectangleDrawingMapper.ensureInitialized();
  @override
  $R call(
          {int? left,
          int? top,
          int? width,
          int? height,
          Object? colorHex = $none}) =>
      $apply(FieldCopyWithData({
        if (left != null) #left: left,
        if (top != null) #top: top,
        if (width != null) #width: width,
        if (height != null) #height: height,
        if (colorHex != $none) #colorHex: colorHex
      }));
  @override
  RectangleDrawing $make(CopyWithData data) => RectangleDrawing(
      left: data.get(#left, or: $value.left),
      top: data.get(#top, or: $value.top),
      width: data.get(#width, or: $value.width),
      height: data.get(#height, or: $value.height),
      colorHex: data.get(#colorHex, or: $value.colorHex));

  @override
  RectangleDrawingCopyWith<$R2, RectangleDrawing, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _RectangleDrawingCopyWithImpl($value, $cast, t);
}

class SpinnerDrawingMapper extends SubClassMapperBase<SpinnerDrawing> {
  SpinnerDrawingMapper._();

  static SpinnerDrawingMapper? _instance;
  static SpinnerDrawingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SpinnerDrawingMapper._());
      GYWDrawingMapper.ensureInitialized().addSubMapper(_instance!);
      AnimationTimingFunctionMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SpinnerDrawing';

  static int _$left(SpinnerDrawing v) => v.left;
  static const Field<SpinnerDrawing, int> _f$left =
      Field('left', _$left, opt: true, def: 0);
  static int _$top(SpinnerDrawing v) => v.top;
  static const Field<SpinnerDrawing, int> _f$top =
      Field('top', _$top, opt: true, def: 0);
  static double _$scale(SpinnerDrawing v) => v.scale;
  static const Field<SpinnerDrawing, double> _f$scale =
      Field('scale', _$scale, opt: true, def: 1.0);
  static int? _$colorHex(SpinnerDrawing v) => v.colorHex;
  static const Field<SpinnerDrawing, int> _f$colorHex =
      Field('colorHex', _$colorHex, key: 'color', opt: true);
  static AnimationTimingFunction _$animationTimingFunction(SpinnerDrawing v) =>
      v.animationTimingFunction;
  static const Field<SpinnerDrawing, AnimationTimingFunction>
      _f$animationTimingFunction = Field(
          'animationTimingFunction', _$animationTimingFunction,
          key: 'animation_timing_function',
          opt: true,
          def: AnimationTimingFunction.linear);
  static double _$spinsPerSecond(SpinnerDrawing v) => v.spinsPerSecond;
  static const Field<SpinnerDrawing, double> _f$spinsPerSecond = Field(
      'spinsPerSecond', _$spinsPerSecond,
      key: 'spins_per_second', opt: true, def: 1.0);

  @override
  final MappableFields<SpinnerDrawing> fields = const {
    #left: _f$left,
    #top: _f$top,
    #scale: _f$scale,
    #colorHex: _f$colorHex,
    #animationTimingFunction: _f$animationTimingFunction,
    #spinsPerSecond: _f$spinsPerSecond,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'SpinnerDrawing';
  @override
  late final ClassMapperBase superMapper = GYWDrawingMapper.ensureInitialized();

  static SpinnerDrawing _instantiate(DecodingData data) {
    return SpinnerDrawing(
        left: data.dec(_f$left),
        top: data.dec(_f$top),
        scale: data.dec(_f$scale),
        colorHex: data.dec(_f$colorHex),
        animationTimingFunction: data.dec(_f$animationTimingFunction),
        spinsPerSecond: data.dec(_f$spinsPerSecond));
  }

  @override
  final Function instantiate = _instantiate;

  static SpinnerDrawing fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SpinnerDrawing>(map);
  }

  static SpinnerDrawing fromJson(String json) {
    return ensureInitialized().decodeJson<SpinnerDrawing>(json);
  }
}

mixin SpinnerDrawingMappable {
  String toJson() {
    return SpinnerDrawingMapper.ensureInitialized()
        .encodeJson<SpinnerDrawing>(this as SpinnerDrawing);
  }

  Map<String, dynamic> toMap() {
    return SpinnerDrawingMapper.ensureInitialized()
        .encodeMap<SpinnerDrawing>(this as SpinnerDrawing);
  }

  SpinnerDrawingCopyWith<SpinnerDrawing, SpinnerDrawing, SpinnerDrawing>
      get copyWith => _SpinnerDrawingCopyWithImpl(
          this as SpinnerDrawing, $identity, $identity);
  @override
  String toString() {
    return SpinnerDrawingMapper.ensureInitialized()
        .stringifyValue(this as SpinnerDrawing);
  }

  @override
  bool operator ==(Object other) {
    return SpinnerDrawingMapper.ensureInitialized()
        .equalsValue(this as SpinnerDrawing, other);
  }

  @override
  int get hashCode {
    return SpinnerDrawingMapper.ensureInitialized()
        .hashValue(this as SpinnerDrawing);
  }
}

extension SpinnerDrawingValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SpinnerDrawing, $Out> {
  SpinnerDrawingCopyWith<$R, SpinnerDrawing, $Out> get $asSpinnerDrawing =>
      $base.as((v, t, t2) => _SpinnerDrawingCopyWithImpl(v, t, t2));
}

abstract class SpinnerDrawingCopyWith<$R, $In extends SpinnerDrawing, $Out>
    implements GYWDrawingCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {int? left,
      int? top,
      double? scale,
      int? colorHex,
      AnimationTimingFunction? animationTimingFunction,
      double? spinsPerSecond});
  SpinnerDrawingCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SpinnerDrawingCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SpinnerDrawing, $Out>
    implements SpinnerDrawingCopyWith<$R, SpinnerDrawing, $Out> {
  _SpinnerDrawingCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SpinnerDrawing> $mapper =
      SpinnerDrawingMapper.ensureInitialized();
  @override
  $R call(
          {int? left,
          int? top,
          double? scale,
          Object? colorHex = $none,
          AnimationTimingFunction? animationTimingFunction,
          double? spinsPerSecond}) =>
      $apply(FieldCopyWithData({
        if (left != null) #left: left,
        if (top != null) #top: top,
        if (scale != null) #scale: scale,
        if (colorHex != $none) #colorHex: colorHex,
        if (animationTimingFunction != null)
          #animationTimingFunction: animationTimingFunction,
        if (spinsPerSecond != null) #spinsPerSecond: spinsPerSecond
      }));
  @override
  SpinnerDrawing $make(CopyWithData data) => SpinnerDrawing(
      left: data.get(#left, or: $value.left),
      top: data.get(#top, or: $value.top),
      scale: data.get(#scale, or: $value.scale),
      colorHex: data.get(#colorHex, or: $value.colorHex),
      animationTimingFunction: data.get(#animationTimingFunction,
          or: $value.animationTimingFunction),
      spinsPerSecond: data.get(#spinsPerSecond, or: $value.spinsPerSecond));

  @override
  SpinnerDrawingCopyWith<$R2, SpinnerDrawing, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SpinnerDrawingCopyWithImpl($value, $cast, t);
}
