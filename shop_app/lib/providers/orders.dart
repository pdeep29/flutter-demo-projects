import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/providers/product.dart';
import './cart.dart';
import 'package:http/http.dart' as http;

class OrderItem {
  final String id;
  final double amount;
  final List<cartItem> products;
  final DateTime dateTime;
  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchAndSetOrders() async {
    var url = Uri.parse(
        'https://shopapp-2bfe8-default-rtdb.firebaseio.com/orders.json');
    final response = await http.get(url);
    print(jsonDecode(response.body));
    List<OrderItem> loadOrderItems = [];
    if (jsonDecode(response.body) == null) {
      return;
    }
    final extractData = jsonDecode(response.body) as Map<String, dynamic>;

    extractData.forEach((orderId, orderData) {
      loadOrderItems.add(OrderItem(
          id: orderId,
          amount: orderData['amount'],
          // products: orderData['products'],
          dateTime: DateTime.parse(orderData['dateTime']),
          products: (orderData['products'] as List<dynamic>)
              .map((item) => cartItem(
                  id: item['id'],
                  title: item['title'],
                  quantity: item['quantity'],
                  price: item['price']))
              .toList()));
    });
    _orders = loadOrderItems.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrders(List<cartItem> cartProducts, double total) async {
    var url = Uri.parse(
        'https://shopapp-2bfe8-default-rtdb.firebaseio.com/orders.json');
    final timestamp = DateTime.now();
    final response = await http.post(
      url,
      body: jsonEncode({
        'amount': total,
        'dateTime': timestamp.toIso8601String(),
        'products': cartProducts
            .map((e) => {
                  'id': e.id,
                  'title': e.title,
                  'quantity': e.quantity,
                  'price': e.price,
                })
            .toList(),
      }),
    );
    _orders.insert(
        0,
        OrderItem(
            id: jsonDecode(response.body)['name'],
            amount: total,
            products: cartProducts,
            dateTime: DateTime.now()));
    notifyListeners();
  }
}
