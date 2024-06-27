import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/entity/BaseEntity.dart';
import 'package:flutter_application_1/http/Api.dart';
import 'package:flutter_application_1/http/HttpUtils.dart';
import 'package:easy_refresh/easy_refresh.dart';

import '../entity/ArticleEntity.dart';
import '../res/YColors.dart';
import 'WebView.dart';

class MySearchDelegate extends SearchDelegate {
  int index = 0;
  List<ArticleEntity>? datas;
  EasyRefreshController _controller = new EasyRefreshController();

  MySearchDelegate(String hideText)
      : super(
          searchFieldLabel: hideText,
          keyboardType: TextInputType.text,
          searchFieldStyle: const TextStyle(color: Colors.white),
        ) {
    getHotKey();
  }

  getHotKey() async {
    Response response = await HttpUtils.getInstance().get(Api.HOT_KEY);
  }

  Future<List<ArticleEntity>?> getDataByKey() async {
    print(query);
    var data = {"k": query};
    Response response = await HttpUtils.getInstance()
        .post("article/query/$index/json", data: data);
    var jsonData = jsonDecode(response.toString());
    BaseEntity<ArticleEntityListData> articleData = BaseEntity.fromJson(
        jsonData, (json) => ArticleEntityListData.fromJson(json));
    if (!(articleData.data.over ?? true)) {
      index++;
      if (datas == null) {
        datas = articleData.data.datas;
      } else {
        datas?.addAll(articleData.data.datas as Iterable<ArticleEntity>);
      }
    }
    return datas;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      TextButton(
          onPressed: () async {
            index = 0;
            datas?.clear();
            getDataByKey().then((value) => showResults(context));
          },
          child: const Text(
            "搜索",
            style: TextStyle(color: Colors.white),
          )),
      IconButton(
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
          icon: const Icon(Icons.close, color: Colors.white))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back, color: Colors.white));
  }

  @override
  Widget buildResults(BuildContext context) {
    return EasyRefresh(
      controller: _controller,
      onLoad:(){
        print("onLoad");
      },
      onRefresh: (){
        print("onRefresh");
      },
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
          itemCount: datas?.length ?? 0,
          itemBuilder: (context, index) {
            return articleItem(context, datas![index]);
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column(
      children: [Text("suggest")],
    );
  }

  Widget articleItem(BuildContext context, ArticleEntity articleData) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      child: ListTile(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
              articleData.collect! ? Icons.favorite : Icons.favorite_border),
        ),
        title: Text(
          articleData.title
                  ?.replaceAll("<em class='highlight'>", "【")
                  .replaceAll("<\/em>", "】") ??
              "",
        ),
        subtitle: Row(
          children: [
            Text(articleData.superChapterName ?? ""),
            Text("   ${articleData.shareUser ?? ""}")
          ],
        ),
        trailing: const Icon(Icons.arrow_right),
        isThreeLine: true,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return WebView();
          }));
        },
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.blue,
        iconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
        titleTextStyle: theme.textTheme.titleLarge,
        toolbarTextStyle: theme.textTheme.bodyMedium,
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            labelStyle: const TextStyle(color: Colors.white),
            hintStyle: theme.inputDecorationTheme.hintStyle,
            border: const UnderlineInputBorder(),
          ),
    );
  }
}
