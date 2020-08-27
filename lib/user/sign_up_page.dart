// import 'package:flutter/material.dart';
// import 'package:gtkbasket/user/login_page.dart';

// class SignupScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width =  MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Color(0xFFBE29EC),
//         title: Text("Register Page"),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(20),
//           height: height,
//           width: width,
//           child: Column(
//             children: <Widget>[
//               SizedBox(height: 30,),
//               Container_Widget(text:"Username",iconCode: 59389,size:34,obsecure_text: false),
//               SizedBox(height: 30,),
//               Container_Widget(text:"Email",iconCode: 57534,size: 26,obsecure_text: false),
//               SizedBox(height: 30,),
//               Container_Widget(text:"Phone Number",iconCode: 57549,size: 27,obsecure_text: false),
//               SizedBox(height: 30,),
//               Container_Widget(text:"Password",iconCode: 59543,size: 25,obsecure_text: true,),
//               SizedBox(height: 30,),
//               Container_Widget(text:"Address",iconCode: 57544,size: 25,obsecure_text: false,),
//               SizedBox(height: 40,),
//               SizedBox(
//                 height: 60,
//                 width: 200,
//                 child: Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(60),
//                       color: Color(0xFFBE29EC),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 7,
//                             blurRadius: 8,
//                             offset: Offset(5,8)
//                         )
//                       ]
//                   ),
//                   child: FlatButton(
//                     //color: Color(0xFFff406f),
//                     child: Text("Submit",style: TextStyle(fontSize: 25,color: Colors.black),),
//                     onPressed: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context){
//                         return LoginScreen();
//                       }));
//                     },
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// //This widget return a container containing an icon and a hint text that is passes during the invocation..
// class Container_Widget extends StatelessWidget {
//   String text;
//   int iconCode;
//   double size;
//   bool obsecure_text;
//   Container_Widget({this.text,this.iconCode,this.size,this.obsecure_text});
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width =  MediaQuery.of(context).size.width;
//     return Container(
//         padding: EdgeInsets.fromLTRB(15,0,0,0),
//         height: height * 0.08,
//         width: width * 0.9,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(60),
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 7,
//                   blurRadius: 8,
//                   offset: Offset(5,8)
//               )
//             ]
//         ),
//         child: Row(
//           children: <Widget>[
//             Icon(IconData(iconCode,fontFamily: 'MaterialIcons',),size: size,color:Colors.black),
//             Container(
//               //color: Colors.orange,
//               padding: EdgeInsets.fromLTRB(30,0,0,0),
//               height: height * 0.08,
//               width: width * 0.6,
//               child: TextField(
//                 obscureText: obsecure_text,
//                 style: TextStyle(
//                     fontSize: 25,color: Colors.black,fontWeight: FontWeight.w500
//                 ),
//                 decoration: InputDecoration(
//                     border: InputBorder.none,
//                     disabledBorder: InputBorder.none,
//                     hintText: text,
//                     hintStyle: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w500),
//                     enabledBorder: InputBorder.none
//                 ),
//               ),
//             )
//           ],
//         )
//     ) ;
//   }
// }
