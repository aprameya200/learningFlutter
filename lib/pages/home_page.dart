import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //has head , body and footer
        appBar: AppBar(
          title: Text("Catologue App"),
        ),
        body: Center(
            //main body of app
            child: Container(
          child: Text("Welcome to flutter"),
        )),
        drawer: Drawer()); //hamburger menu icon and feature
  }
}
