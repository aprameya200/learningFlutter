import 'package:flutter/material.dart';
import 'package:learningdart/models/catalog.dart';

class ItemsWidget extends StatelessWidget {
  final Item items;

  const ItemsWidget(this.items);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${items.name} pressed");
        },
        contentPadding: EdgeInsets.all(20.0),
        leading: Image(image: NetworkImage(items.image)),
        subtitle: Text(items.desc),
        title: Text(items.name),
        trailing: Text(
          "\$" + items.price.toString(),
          textScaleFactor: 1.4,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
