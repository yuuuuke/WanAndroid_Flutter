
import 'package:flutter/material.dart';

class SquareView extends StatefulWidget{
  const SquareView({super.key});

  @override
  State<StatefulWidget> createState() {
    return SquareState();
  }
}

class SquareState extends State{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("广场"),
      ),
    );
  }

}