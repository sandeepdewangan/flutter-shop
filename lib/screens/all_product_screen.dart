import 'package:eshop/models/product.dart';
import 'package:eshop/providers/product.dart';
import 'package:eshop/widgets/single_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllProductScreen extends StatelessWidget {
  static const routeName = 'all-product';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('e-Shop'),
      ),
      body: GridView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => ChangeNotifierProvider(
          create: (context) => products[index],
            child: SingleProduct()
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      ),
    );
  }
}
