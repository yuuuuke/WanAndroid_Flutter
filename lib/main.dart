import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/HomeView.dart';
import 'package:flutter_application_1/res/YColors.dart';
import 'package:flutter_application_1/view/SearchView.dart';

import 'View/SquareView.dart';

void main() {
  runApp(const AppPage());
}

final pages = [
  const HomeView(),
  const SquareView(),
  const HomeView(),
  const HomeView(),
  const HomeView(),
];

class AppPage extends StatelessWidget{
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends State<MainApp> {
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("玩Android_Flutter"),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: MySearchDelegate("请输入搜索内容"));
                },
              )
            ],
          ),
          drawer: getDrawer(),
          body: pages[selectedPage],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.blue,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            onTap: (index) {
              setState(() {
                selectedPage = index;
              });
            },
            currentIndex: selectedPage,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
              BottomNavigationBarItem(icon: Icon(Icons.abc), label: "项目"),
              BottomNavigationBarItem(icon: Icon(Icons.abc), label: "广场"),
            ],
          ),
        ),
      );
  }

  Widget getDrawer() {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              currentAccountPicture: SizedBox(
                height: 50,
                width: 50,
                child: ClipOval(
                    child: Image.network(
                        "https://avatars.githubusercontent.com/u/41458587?v=4")),
              ),
              accountName: const Text("Name:Yuuuuke"),
              accountEmail: const Text("Email:zhiouwp@gamil.com"),
            ),
          ),

        ],
      ),
    );
  }
}
