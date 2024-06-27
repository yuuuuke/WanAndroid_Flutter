// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BannerEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerEntity _$BannerEntityFromJson(Map<String, dynamic> json) => BannerEntity(
      imagePath: json['imagePath'] as String?,
      id: (json['id'] as num?)?.toInt(),
      isVisible: (json['isVisible'] as num?)?.toInt(),
      title: json['title'] as String?,
      type: (json['type'] as num?)?.toInt(),
      url: json['url'] as String?,
      desc: json['desc'] as String?,
      order: (json['order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BannerEntityToJson(BannerEntity instance) =>
    <String, dynamic>{
      'imagePath': instance.imagePath,
      'id': instance.id,
      'isVisible': instance.isVisible,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
      'desc': instance.desc,
      'order': instance.order,
    };
