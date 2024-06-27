import 'package:json_annotation/json_annotation.dart';

part 'BaseEntity.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseEntity<T> {
  T data;
  int errorCode;
  String errorMsg;

  BaseEntity(this.data, this.errorCode, this.errorMsg);

  factory BaseEntity.fromJson(
          Map<String, dynamic> json, T Function(dynamic json) fromJsonT) =>
      _$BaseEntityFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseEntityToJson<T>(this, toJsonT);


}