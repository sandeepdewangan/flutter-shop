import 'package:eshop/providers/cart.dart';
import 'package:eshop/providers/product.dart';
import 'package:eshop/screens/all_product_screen.dart';
import 'package:eshop/screens/cart_screen.dart';
import 'package:eshop/screens/product_detail_screen.dart';
import 'package:eshop/widgets/single_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
      ],
      child: MaterialApp(
        title: 'Shopping Application',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrangeAccent,
          fontFamily: 'Lato'
        ),
        home: AllProductScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
        },
      ),
    );
  }
}
