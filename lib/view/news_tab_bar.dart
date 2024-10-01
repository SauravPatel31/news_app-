import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/app_const_data.dart';
import 'package:news_app/view/home_page.dart';
import 'package:news_app/view/theme_provider.dart';
import 'package:provider/provider.dart';

class NewsTabBar extends StatefulWidget{
  @override
  State<NewsTabBar> createState() => _NewsTabBarState();
}

class _NewsTabBarState extends State<NewsTabBar> with SingleTickerProviderStateMixin{
  TabController?_tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 12, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
  // bool isValue = context.watch<ThemeProvider>().getThemeValue();
   bool isValue = context.watch<ThemeProvider>().getThemeValue();
    return Scaffold(
      appBar: AppBar(
        title: Text("My News"),
        actions: [
          IconButton(onPressed: ()async{
            context.read<ThemeProvider>().changeThemeValue(isValue=!isValue);
            setState(() {

            });
          }, icon: Icon(isValue?Icons.dark_mode:Icons.light_mode)),
          IconButton(onPressed: (){

          }, icon: Icon(Icons.notifications_none_rounded)),
          IconButton(onPressed: (){}, icon: Icon(Icons.account_circle_sharp)),
        ],
        bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: AppConstData.tabName.map((tabValue) {
              return Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Image.asset(tabValue['tIcon'],width: 15,fit: BoxFit.cover,),
                      SizedBox(width: 8,),
                      Text(tabValue['tName'])
                  ],
                ),
              );
            },).toList()
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomePage(),
          Center(child: Text("News")),
          Center(child: Text("News")),
          Center(child: Text("News")),
          Center(child: Text("News")),
          Center(child: Text("News")),
          Center(child: Text("News")),
          Center(child: Text("News")),
          Center(child: Text("News")),
          Center(child: Text("News")),
          Center(child: Text("News")),
          Center(child: Text("News")),

        ],
      ),
    );
  }
}