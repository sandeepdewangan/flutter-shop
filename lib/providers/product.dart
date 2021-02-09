import 'dart:convert';

import 'package:eshop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  List<Product> _items = [];

  bool _showFavoritesOnly = false;

  List<Product> get items {
    if (_showFavoritesOnly) {
      return _items.where((item) => item.isFavorite).toList();
    }
    return [..._items]; // return copy of list of items.
  }

  Future<void> addProduct(Product product) async {
    const url =
        'https://flutter-test-aed7b-default-rtdb.firebaseio.com/products.json';
    try {
      final response = await http.post(url,
          body: json.encode({
            'title': product.title,
            'description': product.description,
            'imageUrl': product.imgeUrl,
            'price': product.price,
            'isFavorite': product.isFavorite,
          }));

      final newProduct = Product(
          id: json.decode(response.body)['name'],
          title: product.title,
          description: product.description,
          price: product.price,
          imgeUrl: product.imgeUrl);
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<void> fetchProducts() async {
    const url =
        'https://flutter-test-aed7b-default-rtdb.firebaseio.com/products.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> products = [];
      extractedData.forEach((key, value) {
        products.add(Product(
            id: key,
            title: value['title'],
            description: value['description'],
            price: value['price'],
            imgeUrl: value['imageUrl']));
      });
      _items = products;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> updateProduct(String id, Product product) async{
    final index = _items.indexWhere((element) => element.id == id);
    final url =
        'https://flutter-test-aed7b-default-rtdb.firebaseio.com/products/$id.json';
    await http.patch(url, body: json.encode({
      'title': product.title,
      'description': product.description,
      'imageUrl': product.imgeUrl,
      'price': product.price,
      'isFavorite': product.isFavorite,
    })); 
    _items[index] = product;
    notifyListeners();
  }

  void setFavStatus(bool status) {
    _showFavoritesOnly = status;
    notifyListeners();
  }

  Product findById(String id) {
    return _items.firstWhere((item) => item.id == id);
  }

  void removeProduct(String id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
