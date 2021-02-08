import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  double get totalAmount{
    double total = 0;
    _items.forEach((key, product) {
      total += product.price * product.quantity;
    });

    return total;
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      // change qty
      _items.update(
          productId,
          (oldValue) => CartItem(
              id: oldValue.id,
              title: oldValue.title,
              quantity: oldValue.quantity + 1,
              price: oldValue.price));
    } else {
      // add to cart
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              price: price));
    }

    notifyListeners();
  }

  void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }
}
