import 'package:eshop/models/product.dart';
import 'package:eshop/widgets/single_product.dart';
import 'package:flutter/material.dart';

class AllProductScreen extends StatelessWidget {

  static const routeName = 'all-product';

  final List<Product> all_product = [
    Product(id: '1', title: 'Tee - 1', description: 'A nice t shirt fits all', price: 499.99, imgeUrl: "https://149360821.v2.pressablecdn.com/wp-content/uploads/2013/11/Dead-Link-T-Shirt.jpg"),
    Product(id: '2', title: 'Tee - 2', description: 'A nice t shirt fits all', price: 599.99, imgeUrl: "https://149360821.v2.pressablecdn.com/wp-content/uploads/2013/11/Dead-Link-T-Shirt.jpg"),
    Product(id: '3', title: 'Tee - 4', description: 'A nice t shirt fits all', price: 399.99, imgeUrl: "https://149360821.v2.pressablecdn.com/wp-content/uploads/2013/11/Dead-Link-T-Shirt.jpg"),
    Product(id: '4', title: 'Tee - 3', description: 'A nice t shirt fits all', price: 699.99, imgeUrl: "https://149360821.v2.pressablecdn.com/wp-content/uploads/2013/11/Dead-Link-T-Shirt.jpg"),
    Product(id: '5', title: 'Tee - 5', description: 'A nice t shirt fits all', price: 569.99, imgeUrl: "https://149360821.v2.pressablecdn.com/wp-content/uploads/2013/11/Dead-Link-T-Shirt.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('e-Shop'),
      ),
      body: GridView.builder(
        itemCount: all_product.length,
        itemBuilder: (context, index) => SingleProduct(id: all_product[index].id, title: all_product[index].title, imageUrl: all_product[index].imgeUrl,),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      ),
    );
  }
}
