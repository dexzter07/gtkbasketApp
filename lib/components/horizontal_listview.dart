import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtkbasket/categories/electronics.dart';

class Horizontal_listView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 500,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Electronics();
              }));
            },
            child: Category(
              image_location: 'images/category/electronic.jpg',
              image_caption: 'Electronics',
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Electronics();
              }));
            },
            child: Category(
              image_location: 'images/category/homecare.jpg',
              image_caption: 'Home Care',
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Electronics();
              }));
            },
            child: Category(
              image_location: 'images/category/household.jpg',
              image_caption: 'Household',
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Electronics();
              }));
            },
            child: Category(
              image_location: 'images/category/personal.jpg',
              image_caption: 'Personal Care',
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Electronics();
              }));
            },
            child: Category(
              image_location: 'images/category/beverages.jpg',
              image_caption: 'Beverages',
            ),
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({
    this.image_location,
    this.image_caption
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(22,10,10,0),
      width: 190,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Container(
              height: 100,
              child: Image.asset(image_location,fit: BoxFit.contain,),
            ),
          ),
          SizedBox(height: 6),
          Text(image_caption,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)
        ],
      ),
    );
  }
}
