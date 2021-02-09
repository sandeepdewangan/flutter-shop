import 'package:eshop/providers/product.dart';
import 'package:eshop/screens/edit_product_screen.dart';
import 'package:eshop/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageProducts extends StatelessWidget {
  static const routeName = 'manage-product';

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Products'),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () => Navigator.of(context).pushNamed(EditProductScreen.routeName),),
        ],
      ),
      body: ListView.builder(
        itemCount: products.items.length,
          itemBuilder: (ctx, index){
            return Column(
              children: [
                ListTile(
                  title: Text(products.items[index].title),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(products.items[index].imgeUrl),
                  ),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(icon: Icon(Icons.edit, color: Colors.purple,), onPressed: ()=> Navigator.of(context).pushNamed(EditProductScreen.routeName, arguments: products.items[index].id)),
                        IconButton(icon: Icon(Icons.delete, color: Colors.red, ), onPressed: (){}),
                      ],
                    ),
                  ),
                ),
                Divider(),
              ],
            );
          }
      ),
      drawer: AppDrawer(),
    );
  }
}
