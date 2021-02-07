import 'package:eshop/screens/all_product_screen.dart';
import 'package:eshop/screens/product_detail_screen.dart';
import 'package:eshop/widgets/single_product.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Application',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrangeAccent,
        fontFamily: 'Lato'
      ),
      home: AllProductScreen(),
      routes: {
        ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
      },
    );
  }
}
