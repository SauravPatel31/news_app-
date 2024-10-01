import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/utils/font_style.dart';

class BigCard extends StatelessWidget{
  MediaQueryData?mqData;
  ImageProvider newsImg;
  String newsText;
  VoidCallback saveBtnCallback;
  VoidCallback shareBtnCallback;
  BigCard({required this.newsImg,required this.newsText,required this.saveBtnCallback,required this.shareBtnCallback});

  @override
  Widget build(BuildContext context) {
    mqData = MediaQuery.of(context);
    return mqData!.orientation==Orientation.landscape?Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text(newsText,style: myTextStyle20(),maxLines: 7,overflow: TextOverflow.ellipsis,)),
              SizedBox(width: 8,),
              Expanded(child: Image(image: newsImg,width: mqData!.size.width,height: mqData!.size.height*0.5,fit: BoxFit.fill,)),

            ],
          ),
          ///Save and Share Button..
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: saveBtnCallback,
                child: Row(
                  children: [
                    Icon(Icons.save_outlined),
                    Text("Save")
                  ],
                ),
              ),
              InkWell(
                onTap: shareBtnCallback,
                child: Row(
                  children: [
                    Icon(Icons.share),
                    Text("Share")
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    ):Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(newsText,style: myTextStyle20(),maxLines: 4,overflow: TextOverflow.ellipsis,),
        SizedBox(height: 10,),
        ///Video or Image..
        Image(image: newsImg,width: mqData!.size.width,height: mqData!.size.width*0.6, fit: BoxFit.cover,),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: saveBtnCallback,
              child: Row(
                children: [
                  Icon(Icons.save_outlined),
                  Text("Save")
                ],
              ),
            ),

            InkWell(
              onTap: shareBtnCallback,
              child: Row(
                children: [
                  Icon(Icons.share),
                  Text("Share")
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),

      ],
    );
  }
}

class myListTile extends StatelessWidget{
  MediaQueryData?mqData;
  String newsText;
  ImageProvider newsImg;
  VoidCallback saveBtnCallback;
  VoidCallback shareBtnCallback;
  myListTile({required this.newsText,required this.newsImg,required this.saveBtnCallback,required this.shareBtnCallback});
  @override
  Widget build(BuildContext context) {
    mqData = MediaQuery.of(context);
   return Column(
     children: [
       ///Image or Video..
       Row(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Expanded(child: Text(newsText,overflow: TextOverflow.ellipsis,maxLines: 4,style: myTextStyle15(),)),
           SizedBox(width: 10,),
           Image(image: newsImg,width: 160,height: 100,fit: BoxFit.fill,),
         ],
       ),
      SizedBox(height: 10,),
       ///News Type and Save and Share Button
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text("News Type",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
           InkWell(
               onTap: saveBtnCallback,
               child: Row(
                 children: [
                   Icon(Icons.save_outlined),
                   SizedBox(width: 5,),
                   Text("Save")
                 ],
               )
           ),
           ///Share Button..
           InkWell(
             onTap: shareBtnCallback,
             child: Row(
               children: [
                 Icon(Icons.share),
                 SizedBox(width: 5,),
                 Text("Share")
               ],
             ),
           )

         ],
       ),
       Divider(height: 30,thickness: 2)
     ],
   );
  }

}

///Custom TextField
class myTextField extends StatelessWidget{
  String hintText;
  TextInputType keyBordType;
  TextEditingController? textEditingController;
  int? charMaxLength;
  bool isFocus;
  IconData suficsIcon;
  myTextField({required this.hintText,required this.suficsIcon,this.keyBordType=TextInputType.text,this.isFocus=false,this.charMaxLength,this.textEditingController});
  @override
  Widget build(BuildContext context) {
   return TextField(
     controller: textEditingController,
     keyboardType: keyBordType,
     maxLength: charMaxLength,
     autofocus: isFocus,
     decoration: InputDecoration(
       enabledBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(12),
         borderSide: BorderSide(width: 1,color: Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.black)
       ),
       focusedBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(12),
           borderSide: BorderSide(width: 1,color: Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.black)
       ),
       hintText: hintText,
       suffixIcon: IconButton(onPressed: (){}, icon: Icon(suficsIcon)),
     ),
   );
  }

}