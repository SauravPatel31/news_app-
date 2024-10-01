import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/app_const_data.dart';
import 'package:news_app/utils/custome_widget.dart';
import 'package:news_app/view/news_view_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NewsViewPage(imgUrl: "https://media.gettyimages.com/id/1202550100/photo/breaking-news-reporter-reporting-on-coronavirus-from-china.jpg?s=612x612&w=0&k=20&c=N7J2tfneAom44NgWXravrBvvKfvDuLFsdMWcjg2tYYs=",newsText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",),));
                  },
                  child: BigCard(newsImg: NetworkImage("https://media.gettyimages.com/id/1202550100/photo/breaking-news-reporter-reporting-on-coronavirus-from-china.jpg?s=612x612&w=0&k=20&c=N7J2tfneAom44NgWXravrBvvKfvDuLFsdMWcjg2tYYs="), newsText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book", saveBtnCallback: (){}, shareBtnCallback: (){})),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NewsViewPage(newIndex: index,),));
                      },
                      child: myListTile(newsText: AppConstData.showNews[index]['title'], newsImg: NetworkImage(AppConstData.showNews[index]['img']), saveBtnCallback: (){}, shareBtnCallback: (){}));
              },
              itemCount: AppConstData.showNews.length,
              ),
              BigCard(newsImg: NetworkImage("https://media.gettyimages.com/id/1289727543/photo/news-reporter-live-broadcasting-on-road.jpg?s=612x612&w=0&k=20&c=tw2iSbnS_d0yWuGYr-ZpDW-8M584TpdRmKTA6My_3sY="), newsText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book", saveBtnCallback: (){}, shareBtnCallback: (){}),


            ],
          ),
        ),
      ),
    );
  }
}
