import 'dart:convert';

import 'package:eshop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier{
  List<Product> _items = [
    Product(id: '1', title: 'Tee - 1', description: 'A nice t shirt fits all', price: 100, imgeUrl: "https://149360821.v2.pressablecdn.com/wp-content/uploads/2013/11/Dead-Link-T-Shirt.jpg"),
    Product(id: '2', title: 'Tee - 2', description: 'A nice t shirt fits all', price: 200, imgeUrl: "https://149360821.v2.pressablecdn.com/wp-content/uploads/2013/11/Dead-Link-T-Shirt.jpg"),
    Product(id: '3', title: 'Tee - 4', description: 'A nice t shirt fits all', price: 300, imgeUrl: "https://149360821.v2.pressablecdn.com/wp-content/uploads/2013/11/Dead-Link-T-Shirt.jpg"),
    Product(id: '4', title: 'Tee - 3', description: 'A nice t shirt fits all', price: 400, imgeUrl: "https://149360821.v2.pressablecdn.com/wp-content/uploads/2013/11/Dead-Link-T-Shirt.jpg"),
    Product(id: '5', title: 'Tee - 5', description: 'A nice t shirt fits all', price: 500, imgeUrl: "https://149360821.v2.pressablecdn.com/wp-content/uploads/2013/11/Dead-Link-T-Shirt.jpg"),
  ];

  bool _showFavoritesOnly = false;

  List<Product> get items {
    if(_showFavoritesOnly){
      return _items.where((item) => item.isFavorite).toList();
    }
    return [..._items]; // return copy of list of items.
  }

  void addProduct(Product product){
    const url = 'https://flutter-test-aed7b-default-rtdb.firebaseio.com/products.json';
    http.post(url, body: json.encode(
      {
        'title': product.title,
        'description': product.description,
        'imageUrl': product.imgeUrl,
        'price': product.price,
        'isFavorite': product.isFavorite,
      }
    ),).then((value) {
      print(json.decode(value.body));
      final newProduct = Product(id: json.decode(value.body)['name'], title: product.title, description: product.description, price: product.price, imgeUrl: product.imgeUrl);
      _items.add(newProduct);
      notifyListeners();
    });


  }

  void updateProduct(String id, Product product){
    final index = _items.indexWhere((element) => element.id == id);
    _items[index] = product;
    notifyListeners();
  }

  void setFavStatus(bool status){
    _showFavoritesOnly = status;
    notifyListeners();
  }

  Product findById(String id){
    return _items.firstWhere((item) => item.id == id);
  }

  void removeProduct(String id){
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }

}