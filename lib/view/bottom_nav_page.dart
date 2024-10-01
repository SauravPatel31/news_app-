import 'package:flutter/material.dart';
import 'package:news_app/view/news_tab_bar.dart';
import 'package:news_app/view/search_page.dart';
import 'package:news_app/view/video_page.dart';

class BottomNavPage extends StatefulWidget{
  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int selectedIndex=0;

  List<Widget>switchPage=[
    NewsTabBar(),
    VideoPage(),
    SearchPage()
  ];

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: switchPage[selectedIndex],
    bottomNavigationBar: BottomNavigationBar(items: [
      BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home",activeIcon: Icon(Icons.home_filled)),
      BottomNavigationBarItem(icon: Icon(Icons.play_circle_outline),label: "Video",activeIcon: Icon(Icons.play_circle)),
      BottomNavigationBarItem(icon: Icon(Icons.search_outlined),label: "Search",activeIcon: Icon(Icons.search)),
    ],
    currentIndex: selectedIndex,
    onTap: (value){
      selectedIndex=value;
      setState(() {});
    },
    ),
  );
  }
}