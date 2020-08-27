import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:gtkbasket/carousel_products/First_Carousel.dart';
import 'package:http/http.dart' as http;


class Carousels extends StatefulWidget {
  @override
  _CarouselsState createState() => _CarouselsState();
}

class _CarouselsState extends State<Carousels> {

  List list1 =[];
  Future<List>getImages()async{
    var response = await http.get("http://10.0.2.2:8000/api/get_carousel");
    var decoded_data = jsonDecode(response.body);
    for(var i in decoded_data){
      list1.add(i);
    }
    return list1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      child:FutureBuilder(
          future: getImages(),
          builder:(context,snapshot){
            if(snapshot.hasData){
            return Carousel(
                      images: [
                        InkWell(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder:(context){
                                return First_Carousel();
                              } ));
                            },
                            child: Container(
                              child: Image.network(snapshot.data[0]["Image1"],fit: BoxFit.fitWidth,),
                            )
                        ),
                        InkWell(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder:(context){
                                return First_Carousel();
                              } ));
                            },
                            child:Image.network(snapshot.data[0]["Image2"],fit: BoxFit.fitWidth,)
                        ),
                        InkWell(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder:(context){
                                return First_Carousel();
                              } ));
                            },
                            child:Image.network(snapshot.data[0]["Image3"],fit: BoxFit.fitWidth,)),
                      ],
                      dotSize: 4.0,
                      dotColor: Colors.white,
                      dotBgColor: Colors.transparent,
                      autoplay: true,
                      animationCurve: Curves.fastOutSlowIn,
                      animationDuration: Duration(milliseconds: 2000),
                      indicatorBgPadding: 8.0,
                    );}
            else{
              return Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 200,
                  padding: EdgeInsets.fromLTRB(40,0,0,0),
                  child: Center(child: CircularProgressIndicator()),),
              );
            }
                }));
          }

}

