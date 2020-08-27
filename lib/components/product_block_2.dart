import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gtkbasket/components/productdetails.dart';
import 'package:http/http.dart' as http;
import 'package:gtkbasket/components/product_block_1.dart';

class Product_Block_2 extends StatefulWidget {
  @override
  _Product_Block_2State createState() => _Product_Block_2State();
}

class _Product_Block_2State extends State<Product_Block_2> {

  List list1 =[];
  Future<List>getData()async{
    var response = await http.get("http://10.0.2.2:8000/api/get_second_block");
    var decoded_data = jsonDecode(response.body);
    for(var i in decoded_data){
      if (list1.contains(i)) {
      }
      else{
        list1.add(i);
      }
    }
    return list1;
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:  getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.data==null){
            return Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 250,
                padding: EdgeInsets.fromLTRB(40,0,0,0),
                child: Center(child: CircularProgressIndicator()),),
            );
          }
          else{
            return GridView.count(
              shrinkWrap: true,
              childAspectRatio: 0.7,
              physics: ScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              children: <Widget>[
                CustomContainer2(Title:snapshot.data[0]["title"],Image_Url: snapshot.data[0]["image"],Price: snapshot.data[0]["original_price"],DiscountPrice: snapshot.data[0]["discount_price"],Description:snapshot.data[0]["description"]),
                CustomContainer2(Title:snapshot.data[1]["title"],Image_Url: snapshot.data[1]["image"],Price: snapshot.data[1]["original_price"],DiscountPrice: snapshot.data[1]["discount_price"],Description:snapshot.data[1]["description"]),
                CustomContainer2(Title:snapshot.data[2]["title"],Image_Url: snapshot.data[2]["image"],Price: snapshot.data[2]["original_price"],DiscountPrice: snapshot.data[2]["discount_price"],Description:snapshot.data[2]["description"]),
                CustomContainer2(Title:snapshot.data[3]["title"],Image_Url: snapshot.data[3]["image"],Price: snapshot.data[3]["original_price"],DiscountPrice: snapshot.data[3]["discount_price"],Description:snapshot.data[3]["description"]),
              ],
            );
          }});
  }
}

