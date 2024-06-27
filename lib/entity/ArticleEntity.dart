import 'package:json_annotation/json_annotation.dart';

part 'ArticleEntity.g.dart';

@JsonSerializable()
class ArticleEntity {
  final bool? adminAdd;
  final String? apkLink;
  final int? audit;
  final String? author;
  final bool? canEdit;
  final int? chapterId;
  final String? chapterName;
  final bool? collect;
  final int? courseId;
  final String? desc;
  final String? descMd;
  final String? envelopePic;
  final bool? fresh;
  final String? host;
  final int? id;
  final bool? isAdminAdd;
  final String? link;
  final String? niceDate;
  final String? niceShareDate;
  final String? origin;
  final String? prefix;
  final String? projectLink;
  final int? publishTime;
  final int? realSuperChapterId;
  final int? selfVisible;
  final int? shareDate;
  final String? shareUser;
  final int? superChapterId;
  final String? superChapterName;
  final List<dynamic>? tags;
  final String? title;
  final int? type;
  final int? userId;
  final int? visible;
  final int? zan;

  const ArticleEntity({
    this.adminAdd,
    this.apkLink,
    this.audit,
    this.author,
    this.canEdit,
    this.chapterId,
    this.chapterName,
    this.collect,
    this.courseId,
    this.desc,
    this.descMd,
    this.envelopePic,
    this.fresh,
    this.host,
    this.id,
    this.isAdminAdd,
    this.link,
    this.niceDate,
    this.niceShareDate,
    this.origin,
    this.prefix,
    this.projectLink,
    this.publishTime,
    this.realSuperChapterId,
    this.selfVisible,
    this.shareDate,
    this.shareUser,
    this.superChapterId,
    this.superChapterName,
    this.tags,
    this.title,
    this.type,
    this.userId,
    this.visible,
    this.zan,
  });

  factory ArticleEntity.fromJson(Map<String, dynamic> json) =>
      _$ArticleEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleEntityToJson(this);
}

@JsonSerializable()
class ArticleEntityListData {
  final int? curPage;
  final List<ArticleEntity>? datas;
  final int? offset;
  final bool? over;
  final int? pageCount;
  final int? size;
  final int? total;

  const ArticleEntityListData({
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  });

  factory ArticleEntityListData.fromJson(Map<String, dynamic> json) =>
      _$ArticleEntityListDataFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleEntityListDataToJson(this);
}