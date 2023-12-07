// orderModel.dart

import 'package:flutter/material.dart';

class CartItem {
  final String title;
  final String size;
  final double price;

  CartItem({required this.title, required this.size, required this.price});
}

class Order {
  final int orderId;
  final double totalAmount;
  final List<CartItem> items;

  Order({
    required this.orderId,
    required this.totalAmount,
    required this.items,
  });
}

class OrderModel extends ChangeNotifier {
  List<Order> orders = [];

  void addOrder(Order order) {
    orders.add(order);
    notifyListeners();
  }

  void acceptOrder(Order order) {
    orders.remove(order);
    notifyListeners();
  }
}
