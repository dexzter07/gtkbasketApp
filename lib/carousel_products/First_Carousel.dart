//This widget gives the detail info about the carousel offers!!!

import 'package:flutter/material.dart';
class First_Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GTKBasket"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 200,
            width: 500,
            color: Colors.greenAccent,
          ),
          SizedBox(
            height: 200,

            child:ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  height: 300,
                  width: 500,
                  color: Colors.amber,
                ),
                Container(
                  height: 200,
                  width: 500,
                  color: Colors.pinkAccent,
                ),
              ],
            ),
          ),
          Container(
            height: 500,
            width: 500,
            color: Colors.greenAccent,
          ),
        ],
      )
    );
  }
}
