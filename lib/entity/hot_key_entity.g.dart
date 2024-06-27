// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_key_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotKeyEntity _$HotKeyEntityFromJson(Map<String, dynamic> json) => HotKeyEntity(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorCode: (json['errorCode'] as num?)?.toInt(),
      errorMsg: json['errorMsg'] as String?,
    );

Map<String, dynamic> _$HotKeyEntityToJson(HotKeyEntity instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      link: json['link'] as String?,
      name: json['name'] as String?,
      order: (json['order'] as num?)?.toInt(),
      visible: (json['visible'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'name': instance.name,
      'order': instance.order,
      'visible': instance.visible,
    };
