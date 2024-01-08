import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp_dhq/AdvisorsPage.dart';

import 'Orders.dart';
import 'TabPage.dart';
import 'myInfo.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("userInfo");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);  //隐藏状态栏 上方黑边
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with AutomaticKeepAliveClientMixin {
  PageController _pageController = PageController();
  int _selectedIndex = 0;
  List<Widget> pageList = [AdvisorsPage(), Orders(), myInfo()];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true; // 是否需要缓存

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
          //print("jumpToPage:$index");
          setState(() {
            _selectedIndex = index;
            //print("_selectedIndex: $_selectedIndex");
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "Advisors",
            icon: Image.asset(
              "imags/home2.png",
              color: Colors.grey,
            ),
            activeIcon: Image.asset(
              "imags/home2.png",
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: "Orders",
            icon: Image.asset(
              "imags/chat2.png",
              color: Colors.grey,
            ),
            activeIcon: Image.asset(
              "imags/chat2.png",
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: "Mine",
            icon: Image.asset(
              "imags/me.png",
              color: Colors.grey,
            ),
            activeIcon: Image.asset(
              "imags/me.png",
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: PageView.builder(
          itemBuilder: (BuildContext context, int index) {
            return pageList[index];
          },
          itemCount: pageList.length,
          controller: _pageController,
          onPageChanged: (index) {
            //print("Page: $index");
            setState(() {
              _selectedIndex = index;
            });
          }),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
