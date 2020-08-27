import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gtkbasket/components/Drawers.dart';
import 'package:gtkbasket/components/all_products_block1.dart';
import 'package:gtkbasket/components/all_products_block2.dart';
import 'package:gtkbasket/components/horizontal_listview.dart';
import 'package:gtkbasket/components/offer_slide.dart';
import 'package:gtkbasket/components/product_block_1.dart';
import 'package:gtkbasket/components/Carousel.dart';
import 'package:gtkbasket/components/product_block_2.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFBE29EC),
        title: Text(
          'GTKBasket',
          style: TextStyle(letterSpacing: 1.3, fontWeight: FontWeight.bold),
        ),
        actions: [
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      drawer: new Drawer(child: Drawers()),
      body: ListView(
        children: [
//          Image carousel begins here
          Carousels(),
//          Padding begins here
          new Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
            child: new Text(
              "Categories",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
//          Horizontal list view begins here
          Horizontal_listView(),
//          Grid View start here

          Row(
            //This shows "Everyday Categories" and "See all" in a single row
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10, 14, 0, 0),
                child: new Text(
                  "Rice",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return All_Products_Block1();
                  }));
                },
                child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 14, 29, 0),
                    child: Text(
                      "See all",
                      style: TextStyle(
                          color: Color(0xFFBE29EC),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
              )
            ],
          ),

          SizedBox(height: 630, width: 600, child: Product_Block_1()),

          SizedBox(height: 150, width: 200, child: Offer_Slide()),

          SizedBox(height: 30),

          Row(
            //This shows "Everyday Categories" and "See all" in a single row
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10, 14, 0, 0),
                child: new Text(
                  "Atta",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return All_Products_Block2();
                  }));
                },
                child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 14, 29, 0),
                    child: Text(
                      "See all",
                      style: TextStyle(
                          color: Color(0xFFBE29EC),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
              )
            ],
          ),

          SizedBox(height: 630, width: 600, child: Product_Block_2()),
        ],
      ),
    );
  }
}
