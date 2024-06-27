import 'package:json_annotation/json_annotation.dart';

part 'hot_key_entity.g.dart';

@JsonSerializable()
class HotKeyEntity {
  final List<Data>? data;
  final int? errorCode;
  final String? errorMsg;

  const HotKeyEntity({
    this.data,
    this.errorCode,
    this.errorMsg,
  });

  factory HotKeyEntity.fromJson(Map<String, dynamic> json) =>
      _$HotKeyEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HotKeyEntityToJson(this);
}

@JsonSerializable()
class Data {
  final int? id;
  final String? link;
  final String? name;
  final int? order;
  final int? visible;

  const Data({
    this.id,
    this.link,
    this.name,
    this.order,
    this.visible,
  });

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
