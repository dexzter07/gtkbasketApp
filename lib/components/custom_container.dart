import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  String Title;
  String Image_Url;

  CustomContainer({this.Title,this.Image_Url});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(child: Image.asset(Image_Url,fit: BoxFit.fitHeight,)),
          Text(Title,style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.w600),)
        ],
      ),
    );
  }
}
