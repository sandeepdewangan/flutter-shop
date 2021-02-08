import 'package:eshop/providers/order.dart';
import 'package:eshop/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = 'my-orders';

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Orders>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: ListView.builder(
          itemCount: order.items.length,
          itemBuilder: (ctx, index) {
            return Card(
              margin: EdgeInsets.all(5.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      '${order.items.length} products to order',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Chip(
                            label: Text(
                          '${DateFormat('dd-MM-yyyy hh:mm').format(order.items.toList()[index].dateTime)}',
                          style: TextStyle(color: Colors.white70),
                        ),
                        backgroundColor: Colors.blueGrey,
                        ),
                        Chip(
                            label: Text(
                                'Rs. ${order.items.toList()[index].amount}',
                            style: TextStyle(
                              color: Colors.black87,
                            ),),
                          backgroundColor: Colors.black26,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
      drawer: AppDrawer(),
    );
  }
}
