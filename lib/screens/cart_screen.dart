import 'package:eshop/providers/cart.dart';
import 'package:eshop/providers/order.dart';
import 'package:eshop/widgets/app_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cart-screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Amount',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Spacer(),
                  Chip(
                      backgroundColor: Theme.of(context).primaryColor,
                      label: Text(
                        'Rs. ${cart.totalAmount}',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      )),
                  FlatButton(
                      onPressed: () {
                        Provider.of<Orders>(context, listen: false).addOrder(cart.items.values.toList(), cart.totalAmount);
                        cart.clearCart();
                      },
                      child: Text(
                        'ORDER NOW',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ))
                ],
              ),
            ),
          ),
          // all products
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, index) {
                return Dismissible(
                  key: ValueKey(cart.items.keys.toList()[index]),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_){
                    cart.removeItem(cart.items.keys.toList()[index]);
                  },
                  background: Container(
                      child: Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 40,
                  ),
                    color: Theme.of(context).accentColor,
                    alignment: Alignment.centerRight,
                  ),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Product image
                          CircleAvatar(
                            child: Icon(Icons.shopping_cart),
                          ),
                          // Product title and unit price
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cart.items.values.toList()[index].title),
                              Text(
                                  'Rs. ${cart.items.values.toList()[index].price.toString()}'),
                            ],
                          ),
                          Spacer(),
                          // Qty
                          Chip(
                            label: Text(
                              'x ${cart.items.values.toList()[index].quantity}',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          // Final price
                          Text(
                              'Rs. ${cart.items.values.toList()[index].price * cart.items.values.toList()[index].quantity}'),
                        ],
                      ),
                    ),
                  ),
                  confirmDismiss: (_){
                    return showDialog(
                        context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text('Are you sure to delete product from cart?'),
                        actions: [
                          FlatButton(onPressed: (){ Navigator.of(context).pop(true); }, child: Text('Yes')),
                          FlatButton(onPressed: (){ Navigator.of(context).pop(false); }, child: Text('No')),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
    );
  }
}
