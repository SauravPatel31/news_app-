import 'package:flutter/material.dart';
import 'package:news_app/utils/app_const_data.dart';
import 'package:news_app/utils/font_style.dart';

class NewsViewPage extends StatefulWidget{
  String imgUrl;
  String newsText;
  int newIndex;
  NewsViewPage({this.imgUrl="",this.newsText="",this.newIndex=-1});
  @override
  State<NewsViewPage> createState() => _NewsViewPageState();
}

class _NewsViewPageState extends State<NewsViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.save_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.share,color: Colors.green,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.text_fields))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:widget.newIndex<0?  Column(
            children: [
              Text(widget.newsText,style:myTextStyle20(),),
              Image(image: NetworkImage(widget.imgUrl),width: MediaQuery.of(context).size.width,height: 350,fit: BoxFit.cover,),
              Text(widget.newsText,style: myTextStyle20(),),
            ],
          ):Column(
            children: [
              Text(AppConstData.showNews[widget.newIndex]['title'],style:myTextStyle20(),),
              Image(image: NetworkImage(AppConstData.showNews[widget.newIndex]['img']),width: MediaQuery.of(context).size.width,height: 350,fit: BoxFit.cover,),
              Text(widget.newsText,style: myTextStyle20(),),
            ],
          ),
        ),
      ),
    );
  }
}