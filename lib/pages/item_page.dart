import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;
    final itemArgs = GoRouterState.of(context).extra as Item;

    AppBar appBar = AppBar(
      title: Text('Shopping List'),
      backgroundColor: Colors.blue,
      titleTextStyle: TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
    );
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Hero(
            tag: itemArgs.name,
            child: Image.asset(itemArgs.image, height: 200, fit: BoxFit.cover),
          ),
          SizedBox(height: 16),
          Text('Price: ${itemArgs.price}'),
          Text('Stock: ${itemArgs.stock}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.yellow),
              Text('${itemArgs.rating}'),
            ],
          ),
        ],
      ),
      bottomNavigationBar: footerSection,
    );
  }

  Widget footerSection = Expanded(
    child: Container(
      color: Colors.blue, // Warna latar belakang untuk Container
      padding: const EdgeInsets.all(8.0), // Memberikan padding opsional
      child: const Text(
        'Putra Zakaria Muzaki - 2241720220',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  );
}
