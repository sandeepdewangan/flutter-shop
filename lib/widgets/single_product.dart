import 'package:eshop/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {

  final String id;
  final String title;
  final String imageUrl;


  SingleProduct({@required this.id, @required this.title, @required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName);
            },
            child: Image.network(imageUrl,)
        ),
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon(Icons.favorite),
            color: Theme.of(context).accentColor,
            onPressed: (){},
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: (){},
          ),
          backgroundColor: Colors.black54,
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
        ),
      ),
    );
  }
}
