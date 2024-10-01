import 'package:flutter/material.dart';
import 'package:news_app/utils/app_const_data.dart';
import 'package:news_app/utils/custome_widget.dart';
import 'package:news_app/utils/font_style.dart';

class SearchPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,

        bottom: PreferredSize(preferredSize: Size(double.infinity, double.minPositive+10), child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: myTextField(hintText: "Search", suficsIcon: Icons.search,isFocus: true,),
        )),
      ),
      body: ListView.builder(itemBuilder: (_,index){
        return InkWell(
          onTap: (){},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(AppConstData.newsTypes[index],style: myTextStyle15(),),
              ),
              Divider()
            ],
          ),
        );
      },
        itemCount: AppConstData.newsTypes.length,

      ),
    );
  }

}