import 'package:flutter/material.dart';
import 'package:learningdart/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //has head , body and footer
        appBar: AppBar(
          title: Text(
            "Catolog App",
          ),
        ),
        body: Center(
            //main body of app
            child: Container(
          child: Text("Welcome to home page of app"),
        )),
        drawer:
            MyDrawer()); //hamburger menu icon and feature also it is custom class made by user
  }
}
