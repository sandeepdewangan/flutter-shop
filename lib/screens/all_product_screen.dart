import 'package:eshop/models/product.dart';
import 'package:eshop/providers/cart.dart';
import 'package:eshop/providers/product.dart';
import 'package:eshop/screens/cart_screen.dart';
import 'package:eshop/widgets/app_drawer.dart';
import 'package:eshop/widgets/single_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FilterOptions{
  Favorites,
  All,
}

class AllProductScreen extends StatefulWidget {
  static const routeName = 'all-product';

  @override
  _AllProductScreenState createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('e-Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedMenu) {
              setState(() {
                if(selectedMenu == FilterOptions.Favorites){
                  productsData.setFavStatus(true);
                }else{
                  productsData.setFavStatus(false);
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show all'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, child) => Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //IconButton(icon: Icon(Icons.shopping_cart), onPressed: ()=> Navigator.of(context).pushNamed(CartScreen.routeName)),
                  GestureDetector(
                    onTap: ()=> Navigator.of(context).pushNamed(CartScreen.routeName),
                    child: Icon(Icons.shopping_cart),
                  ),
                  Text(cart.itemCount.toString(), textAlign: TextAlign.start,)
                ],
              ),
            ),
          )

        ],
      ),
      body: GridView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          // Use value in List or Grid View Listing of items. if we want to reuse. Then we can use value.
            value: products[index],
            child: SingleProduct()),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      ),
      drawer: AppDrawer(),
    );
  }
}
