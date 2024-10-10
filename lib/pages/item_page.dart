import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;

    AppBar appBar = AppBar(
      title: Text('Shopping List'),
      backgroundColor: Colors.blue,
      titleTextStyle:
          TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Text(itemArgs.name + ' with ' + itemArgs.price.toString()),
      ),
    );
  }
}
