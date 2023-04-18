// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:learningdart/models/catalog.dart';
import 'package:learningdart/widgets/drawer.dart';
import 'package:learningdart/widgets/themes.dart';

import '../widgets/items_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //object of catalogue model

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));

    final catalogJSON =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = json.decode(catalogJSON);

    var productsArray = decodedData["products"];

    //converts the productsArray into appropriate map type
    //since one each element of productsArray is an item having has one string and value for different info
    CatalogModel.items =
        List.from(productsArray).map<Item>((e) => Item.fromMap(e)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //has head , body and footer
        // appBar: AppBar(
        //   title: Text(
        //     "Catalog App ",
        //   ),
        // ), //returns the build method in item widget
        // body: Padding(
        //   padding: EdgeInsets.all(16.0),
        //   child: (CatalogModel.items.length != null &&
        //           CatalogModel.items.isNotEmpty)
        //       // ? ListView.builder(
        //       //     //loops through the given list
        //       //     itemCount: CatalogModel.items.length,
        //       //     itemBuilder: (BuildContext context, int index) {
        //       //       //loops all available
        //       //       return ItemsWidget(CatalogModel.items[
        //       //           index]); //returns the build method in item widget
        //       //     },
        //       //   )
        //       ? GridView.builder(
        //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //               crossAxisCount: 2, //items per grid row
        //               mainAxisSpacing: 20,
        //               crossAxisSpacing: 20), //spacing
        //           itemBuilder: (BuildContext context, int index) {
        //             return Card(
        //               clipBehavior: Clip.antiAlias,
        //               shape: RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(10)),
        //               child: GridTile(
        //                   header: Container(
        //                     padding: EdgeInsets.all(12),
        //                     color: Colors.amber,
        //                     child: Text("${CatalogModel.items[index].name}"),
        //                   ),
        //                   footer: Container(
        //                     padding: EdgeInsets.all(12),
        //                     color: Colors.green,
        //                     child: Text("\$${CatalogModel.items[index].price}"),
        //                   ),
        //                   //returns a tile in grid
        //                   child:
        //                       Image.network(CatalogModel.items[index].image)),
        //             );
        //           },
        //           itemCount: CatalogModel.items.length)
        //       : Center(
        //           child: CircularProgressIndicator(),
        //         ),
        // ),
        // drawer:
        //     MyDrawer()); //hamburger menu icon and feature also it is custom class made by user
        backgroundColor: MyThemes.cream,
        body: SafeArea(
          child: Container(
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatalogHeader(),
                  if (CatalogModel.items != null &&
                      CatalogModel.items.isNotEmpty)
                    CatalogList().expand()
                  else
                    Center(child: CircularProgressIndicator())
                ],
              )),
        ));
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App"
            .text
            .xl5
            .bold
            .color(MyThemes.darkBlueish)
            .make(), //using velocityX
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CatalogImage(imageName: catalog);
  }
}

class CatalogImage extends StatelessWidget {
  final Item imageName;
  const CatalogImage({
    Key? key,
    required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Image.network(imageName.image)
            .box
            .rounded
            .p8
            .color(MyThemes.cream)
            .make()
            .p16()
            .w40(context),
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                imageName.name.text.lg.bold.make(),
                imageName.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                BuyButton(price: imageName),
              ]),
        ),
      ],
    )).white.roundedLg.square(150).make().py20();
  }
}

class BuyButton extends StatelessWidget {
  final Item price;
  const BuyButton({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      buttonPadding: EdgeInsets.zero,
      alignment: MainAxisAlignment.spaceBetween,
      children: [
        "\$${price.price}".text.bold.xl.make(),
        ElevatedButton(
          onPressed: () {},
          child: Text("Buy"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(MyThemes.darkBlueish),
              shape: MaterialStateProperty.all(StadiumBorder())),
        )
      ],
    ).pOnly(right: 12.0);
  }
}
