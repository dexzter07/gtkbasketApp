import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gtkbasket/components/productdetails.dart';
import 'package:http/http.dart' as http;

class Product_Block_1 extends StatefulWidget {
  @override
  _Product_Block_1State createState() => _Product_Block_1State();
}

class _Product_Block_1State extends State<Product_Block_1> {

  List list1 =[];
  Future<List>getData()async{
    var response = await http.get("http://10.0.2.2:8000/api/get_first_block");
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


class CustomContainer2 extends StatelessWidget {
  String Title;
  String Image_Url;
  double Price;
  double DiscountPrice;
  String Description;
  CustomContainer2({this.Title,this.Image_Url,this.Price,this.DiscountPrice,this.Description});

  @override
  Widget build(BuildContext context) {
    String converted_original_price = Price.toString();
    String converted_discount_price = DiscountPrice.toString();
    return InkWell(
      onTap: ((){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ProductDetails(product_detail_title:Title,product_detail_image: Image_Url,product_detail_price:converted_original_price,product_detail_discount_price:converted_discount_price,product_detail_descriptions:Description);
        }));
      }),
      child: Container(
        padding: EdgeInsets.fromLTRB(10,10,10,11),
        decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 10,
              blurRadius: 10,
              offset: Offset(5,5)
            )
          ]
        ),
        margin: EdgeInsets.all(20),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child: Image.network(Image_Url,fit: BoxFit.fitHeight,)),
            SizedBox(height: 10,),
            Text(Title,style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.w600),),
            SizedBox(height: 10,),
            Text("\u20B9"+converted_original_price,style: TextStyle(color:Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
            Text("\u20B9"+converted_discount_price,style: TextStyle(decoration:TextDecoration.lineThrough,color:Colors.red,fontSize: 15,fontWeight: FontWeight.bold),),

          ],
        ),
      ),
    );
  }
}



