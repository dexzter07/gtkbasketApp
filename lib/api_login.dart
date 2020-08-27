import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Delete extends StatefulWidget {
  @override
  _DeleteState createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  var sagar;
  Future<String>func1()async{
    var response = await http.get("http://10.0.2.2:8000/api/get_first_block");
    setState(() {
              sagar = jsonDecode(response.body);
              print(sagar);
    });
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.func1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hy"),
      ),
      body: //Image.network("http://10.0.2.2:8000/media/pics/atta.jpg"),//For god sake dont use https
            ListView.builder(
              itemCount: sagar.length==0? 0: sagar.length,
              itemBuilder: (context,index){
                return Image.network(sagar[index]);
              },
            )
    );
  }
}


class User{
  String Url;
  User({this.Url});

  factory User.fromJson(Map maps){
    return User(Url:maps["image_url"]);
  }
}