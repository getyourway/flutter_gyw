// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TextDrawingImpl _$$TextDrawingImplFromJson(Map<String, dynamic> json) =>
    _$TextDrawingImpl(
      top: (json['top'] as num?)?.toInt() ?? 0,
      left: (json['left'] as num?)?.toInt() ?? 0,
      text: json['text'] as String,
      font: _$JsonConverterFromJson<Map<String, dynamic>, GYWFont>(
          json['font'], const GYWFontJsonConverter().fromJson),
      size: (json['size'] as num?)?.toInt(),
      colorHex: (json['colorHex'] as num?)?.toInt() ?? 0xFF000000,
      maxWidth: (json['maxWidth'] as num?)?.toInt(),
      maxLines: (json['maxLines'] as num?)?.toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TextDrawingImplToJson(_$TextDrawingImpl instance) =>
    <String, dynamic>{
      'top': instance.top,
      'left': instance.left,
      'text': instance.text,
      'font': _$JsonConverterToJson<Map<String, dynamic>, GYWFont>(
          instance.font, const GYWFontJsonConverter().toJson),
      'size': instance.size,
      'colorHex': instance.colorHex,
      'maxWidth': instance.maxWidth,
      'maxLines': instance.maxLines,
      'runtimeType': instance.$type,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$IconDrawingImpl _$$IconDrawingImplFromJson(Map<String, dynamic> json) =>
    _$IconDrawingImpl(
      top: (json['top'] as num?)?.toInt() ?? 0,
      left: (json['left'] as num?)?.toInt() ?? 0,
      icon: const GYWIconJsonConverter()
          .fromJson(json['icon'] as Map<String, dynamic>),
      colorHex: (json['colorHex'] as num?)?.toInt() ?? 0xFF000000,
      scale: (json['scale'] as num?)?.toDouble() ?? 1.0,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$IconDrawingImplToJson(_$IconDrawingImpl instance) =>
    <String, dynamic>{
      'top': instance.top,
      'left': instance.left,
      'icon': const GYWIconJsonConverter().toJson(instance.icon),
      'colorHex': instance.colorHex,
      'scale': instance.scale,
      'runtimeType': instance.$type,
    };

_$RectangleDrawingImpl _$$RectangleDrawingImplFromJson(
        Map<String, dynamic> json) =>
    _$RectangleDrawingImpl(
      top: (json['top'] as num?)?.toInt() ?? 0,
      left: (json['left'] as num?)?.toInt() ?? 0,
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      colorHex: (json['colorHex'] as num?)?.toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RectangleDrawingImplToJson(
        _$RectangleDrawingImpl instance) =>
    <String, dynamic>{
      'top': instance.top,
      'left': instance.left,
      'width': instance.width,
      'height': instance.height,
      'colorHex': instance.colorHex,
      'runtimeType': instance.$type,
    };

_$SpinnerDrawingImpl _$$SpinnerDrawingImplFromJson(Map<String, dynamic> json) =>
    _$SpinnerDrawingImpl(
      top: (json['top'] as num?)?.toInt() ?? 0,
      left: (json['left'] as num?)?.toInt() ?? 0,
      scale: (json['scale'] as num?)?.toDouble() ?? 1.0,
      colorHex: (json['colorHex'] as num?)?.toInt(),
      animationTimingFunction: $enumDecodeNullable(
              _$AnimationTimingFunctionEnumMap,
              json['animationTimingFunction']) ??
          AnimationTimingFunction.linear,
      spinsPerSecond: (json['spinsPerSecond'] as num?)?.toDouble() ?? 1.0,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SpinnerDrawingImplToJson(
        _$SpinnerDrawingImpl instance) =>
    <String, dynamic>{
      'top': instance.top,
      'left': instance.left,
      'scale': instance.scale,
      'colorHex': instance.colorHex,
      'animationTimingFunction':
          _$AnimationTimingFunctionEnumMap[instance.animationTimingFunction]!,
      'spinsPerSecond': instance.spinsPerSecond,
      'runtimeType': instance.$type,
    };

const _$AnimationTimingFunctionEnumMap = {
  AnimationTimingFunction.linear: 'linear',
  AnimationTimingFunction.ease_in: 'ease_in',
  AnimationTimingFunction.ease_out: 'ease_out',
};
