import 'package:flutter/material.dart';
import 'package:learningdart/models/catalog.dart';
import 'package:learningdart/widgets/drawer.dart';

import '../widgets/items_widget.dart';

class HomePage extends StatelessWidget {
  CatalogModel model = new CatalogModel(); //object of catalogue model

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //has head , body and footer
        appBar: AppBar(
          title: Text(
            "Home ",
          ),
        ), //returns the build method in item widget
        body: ListView.builder(
          padding: EdgeInsets.all(16.0),
          //loops through the given list
          itemCount: model.getItemLength(),
          itemBuilder: (BuildContext context, int index) {
            //loops all available
            return ItemsWidget(
                model.items[index]); //returns the build method in item widget
          },
        ),
        drawer:
            MyDrawer()); //hamburger menu icon and feature also it is custom class made by user
  }
}
