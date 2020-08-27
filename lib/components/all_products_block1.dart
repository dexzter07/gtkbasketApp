import 'package:flutter/material.dart';
import 'package:gtkbasket/components/product_block_1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class All_Products_Block1 extends StatefulWidget {
  @override
  _All_Products_Block1State createState() => _All_Products_Block1State();
}

class _All_Products_Block1State extends State<All_Products_Block1> {

  List list12 =[];
  Future<List>getData()async{
    var response = await http.get("http://10.0.2.2:8000/api/get_first_block");
    var decoded_data = jsonDecode(response.body);
    for(var i in decoded_data){
      if (list12.contains(i)) {
      }
      else{
        list12.add(i);
      }
    }
    return list12;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rice",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 30),),
        backgroundColor: Color(0xFFBE29EC),
      ),
      body: Container(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot){
            if (snapshot.data==null){
              return Container(child: CircularProgressIndicator());
            }
            else{
              return GridView.builder(
                itemCount: snapshot.data.length==0? 0: snapshot.data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio:0.7,crossAxisCount: 2),
                itemBuilder: (context,index){
                  return CustomContainer2(Title:snapshot.data[index]["title"],Image_Url: snapshot.data[index]["image"],Price: snapshot.data[index]["original_price"],DiscountPrice: snapshot.data[index]["discount_price"],Description:snapshot.data[index]["description"]);
              },
              );
            }
          },
        ),
      ),
    );
  }
}
