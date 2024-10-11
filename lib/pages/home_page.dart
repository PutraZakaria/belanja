import 'package:belanja/main.dart';
import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
        name: 'Sugar',
        price: 5000,
        image: 'assets/sugar.jpg',
        stock: 50,
        rating: 4.5),
    Item(
        name: 'Salt',
        price: 2000,
        image: 'assets/salt.jpg',
        stock: 30,
        rating: 4.2),
    Item(
        name: 'Coffee',
        price: 10000,
        image: 'assets/coffee.jpg',
        stock: 10,
        rating: 4.8),
    Item(
        name: 'Tea',
        price: 8000,
        image: 'assets/tea.jpg',
        stock: 20,
        rating: 4.0),
  ];

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text('Shopping List'),
      backgroundColor: Colors.blue,
      titleTextStyle:
          TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        margin: EdgeInsets.all(8),
        child: GridView.builder(
          padding: EdgeInsets.all(8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Dua kolom dalam grid
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ProductCard(context: context, item: item);
          },
        ),
      ),
      bottomNavigationBar: footerSection,
    );
  }

  Widget footerSection = Expanded(
    child: Container(
      color: Colors.blue,
      padding: const EdgeInsets.all(8.0),
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

  Widget ProductCard({required BuildContext context, required Item item}) {
    return InkWell(
      onTap: () {
        context.go('/item/', extra: item);
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: item.name,
              child: Image.asset(
                item.image,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Price: ${item.price}'),
                  Text('Stock: ${item.stock}'),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      Text('${item.rating}', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
