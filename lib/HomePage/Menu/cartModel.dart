import 'package:flutter/foundation.dart';

class CartItem {
  final String title;
  final String size;
  final double price;

  CartItem({
    required this.title,
    required this.size,
    required this.price,
  });
}

class CartModel extends ChangeNotifier {
  final List<CartItem> cart = [];

  void addToCart(CartItem item) {
      cart.add(item);
    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    cart.remove(item);
    notifyListeners();
  }

  double getTotalPrice(){
    double totalPrice= 0.0;
    for(var item in cart){
      totalPrice += item.price;
    }
    return totalPrice;
  }

}
