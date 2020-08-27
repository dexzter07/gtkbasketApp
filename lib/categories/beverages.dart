import 'package:flutter/material.dart';
import 'package:gtkbasket/components/custom_container.dart';


class Beverages extends StatefulWidget {
  @override
  _BeveragesState createState() => _BeveragesState();
}

class _BeveragesState extends State<Beverages> {


  final List<List> list1 = [
    [
      "Mobile Phones",
      "images/electronics/mobiles.jpg"
    ],

    [
      "Home Appliances",
      "images/electronics/home_appliances.jpg"
    ],
    [
      "Headphones",
      "images/electronics/headphones.jpg"
    ],
    [
      "Printers",
      "images/electronics/printers.jpg"
    ],
    [
      "Accessories",
      "images/electronics/accessories.jpg"
    ],
    [
      "Speakers",
      "images/electronics/speakers.jpg"
    ],
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red[500],
          title: Text("GTKBasket"),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            CustomContainer(Title: list1[0][0],Image_Url: list1[0][1],),
            CustomContainer(Title: list1[1][0],Image_Url: list1[1][1],),
            CustomContainer(Title: list1[2][0],Image_Url: list1[2][1],),
            CustomContainer(Title: list1[3][0],Image_Url: list1[3][1],),
            CustomContainer(Title: list1[4][0],Image_Url: list1[4][1],),
            CustomContainer(Title: list1[5][0],Image_Url: list1[5][1],),
          ],
        )
    );
  }
}
