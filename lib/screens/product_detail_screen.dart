import 'package:eshop/providers/product.dart';
import 'package:eshop/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = 'product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final product = Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.network(product.imgeUrl, fit: BoxFit.cover,),
            ),
            Text('Rs. ${product.price}', style: TextStyle(fontSize: 20, color: Colors.blueGrey),),
            Text(product.description, style: TextStyle(fontSize: 20,),),
          ],
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
