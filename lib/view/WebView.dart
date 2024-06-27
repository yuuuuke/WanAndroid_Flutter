import 'package:flutter/material.dart';

class WebView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WebView();
  }
}

class _WebView extends State<WebView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "这是一个webView",
      home: Text("这是一个webView"),
    );
  }
}
