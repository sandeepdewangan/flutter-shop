import 'package:eshop/screens/all_product_screen.dart';
import 'package:eshop/screens/cart_screen.dart';
import 'package:eshop/screens/order_screen.dart';
import 'package:flutter/material.dart';


class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("E-Shoppe"),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
              onTap: () => Navigator.of(context).pushNamed('/'),
          ),
          ListTile(
            leading: Icon(Icons.card_travel),
            title: Text('Orders'),
            onTap: () => Navigator.of(context).pushNamed(OrdersScreen.routeName),
          ),
          ListTile(
            leading: Icon(Icons.more),
            title: Text('About Us'),
            onTap: (){},
          ),
        ],
      ),
    );
  }
}
