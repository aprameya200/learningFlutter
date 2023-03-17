// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageURL =
        "https://images.hitpaw.com/topics/video-tips/cute-anime-3.jpg";

    Color? grey = Colors.grey[900];

    return Drawer(
      backgroundColor: grey,
      child: ListView(
        //adding stuff into drawer
        children: [
          // ignore: prefer_const_constructors
          DrawerHeader(
              //decoration: BoxDecoration(color: Colors.red),
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(color: grey),
                currentAccountPicture:
                    CircleAvatar(backgroundImage: NetworkImage(imageURL)),
                accountName: Text("Aprameya Neopane"),
                accountEmail: Text("aprameyanwopane@gmail.com"),
              )),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.white,
            ),
            title: Text(
              "Home",
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.white,
            ),
            title: Text(
              "Email",
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.info_circle,
              color: Colors.white,
            ),
            title: Text(
              "About",
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
