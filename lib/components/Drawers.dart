import 'package:flutter/material.dart';
import 'package:gtkbasket/main.dart';
import 'package:gtkbasket/services/authservice.dart';

class Drawers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
//            header
        new UserAccountsDrawerHeader(
          accountName: Text('Dexzter'),
          accountEmail: Text('dexztercodes07@gmail.com'),
          decoration: BoxDecoration(color: Color(0xFFBE29EC)),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Home();
            }));
          },
          child: ListTile(
            title: Text('Home Page'),
            leading: Icon(
              Icons.home,
              color: Colors.indigo[800],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: ListTile(
            title: Text('My Orders'),
            leading: Icon(
              Icons.shopping_cart,
              color: Colors.indigo[800],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: ListTile(
            title: Text('Categories'),
            leading: Icon(
              Icons.category,
              color: Colors.indigo[800],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: ListTile(
            title: Text('Favourite'),
            leading: Icon(
              Icons.favorite,
              color: Colors.indigo[800],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AuthService().handleAuth();
            }));
          },
          child: ListTile(
            title: Text('Login'),
            leading: Icon(
              Icons.person,
              color: Colors.indigo[800],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: ListTile(
            title: Text('About'),
            leading: Icon(
              Icons.info,
              color: Colors.indigo[800],
            ),
          ),
        ),
      ],
    );
  }
}
