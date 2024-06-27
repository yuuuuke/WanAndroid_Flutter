import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/entity/BannerEntity.dart';
import 'package:flutter_application_1/entity/BaseEntity.dart';
import 'package:flutter_application_1/http/Api.dart';
import 'package:flutter_application_1/http/HttpUtils.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import '../entity/ArticleEntity.dart';
import '../res/YColors.dart';
import 'WebView.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeView> {
  late EasyRefreshController _controller;
  List<BannerEntity>? bannerData;
  List<ArticleEntity>? articleData;

  int _page = 0;
  bool _isEnd = false;

  @override
  void initState() {
    super.initState();
    getData();
    _controller = EasyRefreshController(
        controlFinishLoad: true, controlFinishRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
          controller: _controller,
          header: const PhoenixHeader(
            skyColor: YColors.colorPrimary,
            position: IndicatorPosition.locator,
            safeArea: false,
          ),
          footer: const PhoenixFooter(
            skyColor: YColors.colorPrimary,
            position: IndicatorPosition.locator,
          ),
          child: ListView.builder(
              itemCount: articleData?.length ?? 0 + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return getBanner();
                } else {
                  return articleItem(articleData![index-1]);
                }
              }),
        );
  }

  getData() async {
    Response bannerResponse = await HttpUtils.getInstance().get(Api.BANNER);
    Map<String, dynamic> json = jsonDecode(bannerResponse.toString());
    BaseEntity<List<BannerEntity>> bannerData =
        BaseEntity.fromJson(json, (json) {
      return (json as List<dynamic>)
          .map((e) => BannerEntity.fromJson(e as Map<String, dynamic>))
          .toList();
    });

    Response articleResponse =
        await HttpUtils.getInstance().get("${Api.ARTICLE_LIST}$_page/json");
    Map<String, dynamic> articleJson = jsonDecode(articleResponse.toString());
    BaseEntity<ArticleEntityListData> articleData = BaseEntity.fromJson(
        articleJson, (json) => ArticleEntityListData.fromJson(json));

    setState(() {
      this.bannerData = bannerData.data;
      this.articleData = articleData.data.datas;
    });

    // if(articleData.data.curPage == articleData.data.pageCount){
    //   setState(() {
    //     _isEnd = true;
    //   });
    // }else{
    //   setState(() {
    //     _isEnd = false;
    //   });
    // }
    //
    // if(articleData.data.curPage == 1){
    //
    // }else{
    //   setState(() {
    //     this.articleData?.addAll(articleData.data.datas as Iterable<ArticleEntity>);
    //   });
    // }
  }

  Widget getBanner() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 1.8 * 0.8,
      child: Swiper(
        itemCount: bannerData?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: YColors.colorPrimary),
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: NetworkImage(bannerData?[index].imagePath ?? ""),
                      fit: BoxFit.fill)),
            ),
          );
        },
      ),
    );
  }

  Widget articleItem(ArticleEntity articleData) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      child: ListTile(
        leading: IconButton(
          onPressed: () {

          },
          icon: Icon(
            articleData.collect! ? Icons.favorite : Icons.favorite_border),
        ),
        title: Text(articleData.title ?? ""),
        subtitle: Row(
          children: [
            Text(articleData.superChapterName ?? ""),
            Text("   ${articleData.shareUser ?? ""}")
          ],
        ),
        trailing: const Icon(Icons.arrow_right),
        isThreeLine: true,
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return WebView();
          }));
        },
      ),
    );
  }
}
