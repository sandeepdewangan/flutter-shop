import 'package:eshop/models/product.dart';
import 'package:flutter/material.dart';

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

  void addProduct(){
    notifyListeners();
  }

  void setFavStatus(bool status){
    _showFavoritesOnly = status;
    notifyListeners();
  }

  Product findById(String id){
    return _items.firstWhere((item) => item.id == id);
  }
}