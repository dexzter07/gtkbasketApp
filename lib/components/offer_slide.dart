import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Offer_Slide extends StatefulWidget {
  @override
  _Offer_SlideState createState() => _Offer_SlideState();
}

class _Offer_SlideState extends State<Offer_Slide> {


  List list12 =[];
  Future<List>getImages()async{
    var response = await http.get("http://10.0.2.2:8000/api/get_offer_images");
    var decoded_data = jsonDecode(response.body);
    print(decoded_data);
    for(var i in decoded_data){
        list12.add(i);
    }
    return list12;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getImages(),
        builder: (context,snapshot){
          if(snapshot.data==null){
            return Container(
              child: CircularProgressIndicator(),
            );
          }
          else{
            return ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20,0,0,0),
                    width:300,
                    child: Image.network(snapshot.data[0]["image1"],fit: BoxFit.fitHeight,),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width:300,
                    child: Image.network(snapshot.data[0]["image2"],fit: BoxFit.fitHeight,),
                  )
                ],
              );

          }
        },
      )
    );
  }
}
