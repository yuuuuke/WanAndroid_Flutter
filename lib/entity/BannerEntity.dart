import 'package:json_annotation/json_annotation.dart';
part 'BannerEntity.g.dart';

@JsonSerializable()
class BannerEntity {
  String? imagePath;
  int? id;
  int? isVisible;
  String? title;
  int? type;
  String? url;
  String? desc;
  int? order;

  BannerEntity(
      {this.imagePath,
      this.id,
      this.isVisible,
      this.title,
      this.type,
      this.url,
      this.desc,
      this.order});

  factory BannerEntity.fromJson(Map<String,dynamic> json) => _$BannerEntityFromJson(json);

  Map<String,dynamic> toJson() => _$BannerEntityToJson(this);

}
