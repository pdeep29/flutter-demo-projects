import 'package:flutter/material.dart';
import 'package:shop_app/widgets/cart_item.dart';

class cartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  cartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  late Map<String, cartItem> _items = {};

  Map<String, cartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void addItems(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCardItem) => cartItem(
              id: existingCardItem.id,
              title: existingCardItem.title,
              quantity: existingCardItem.quantity + 1,
              price: existingCardItem.price));
    } else {
      _items.putIfAbsent(
        productId,
        () => cartItem(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            quantity: 1),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]!.quantity > 1) {
      _items.update(
          productId,
          (existingCardItem) => cartItem(
              id: existingCardItem.id,
              title: existingCardItem.title,
              quantity: existingCardItem.quantity - 1,
              price: existingCardItem.price));
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
