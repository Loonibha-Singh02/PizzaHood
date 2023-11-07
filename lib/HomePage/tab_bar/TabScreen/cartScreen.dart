import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Menu/cartModel.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();

    return Scaffold(
      backgroundColor: const Color(0xFFFFEEE1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var item in cart.cart)
              Container(
                margin: EdgeInsets.all(8), // Add margin for spacing
                padding: EdgeInsets.all(8), // Add padding for border
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black), // Add border
                ),
                child: ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.size),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('\$${item.price.toStringAsFixed(2)}'),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Remove the item from the cart when delete is pressed
                          context.read<CartModel>().removeFromCart(item);
                        },
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
