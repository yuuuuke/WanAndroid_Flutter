// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BaseEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseEntity<T> _$BaseEntityFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseEntity<T>(
      fromJsonT(json['data']),
      (json['errorCode'] as num).toInt(),
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$BaseEntityToJson<T>(
  BaseEntity<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };
