import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    final totalPrice = cart.getTotalPrice();

    return Scaffold(
      backgroundColor: const Color(0xFFFFEEE1),
      body: Column(
        children: [
          // Add a fixed button outside of the items
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (var item in cart.cart)
                    Container(
                      margin: const EdgeInsets.only(right: 20,top: 20, left: 20, bottom:10),
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFFFD7BD),
                          width: 2,
                        ),
                        color: const Color(0xFFFFD7BD),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 20,
                            left: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  item.size,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xBB53575D),
                                  ),
                                ),
                                Text('Rs ${item.price.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xBB53575D),
                                  ),),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 35,
                            right: 10,
                            child:
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                // Remove the item from the cart when delete is pressed
                                context.read<CartModel>().removeFromCart(item);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 200, // Set the width to match the parent width
              height: 50, // Set the desired height
              child:  ElevatedButton(
                onPressed: () async{
                  final cartItems = cart.cart
                      .map((item) =>
                  'Luniva Singh ordered ${item.title} - ${item.size} - ${item.price.toStringAsFixed(2)}')
                      .toList();

                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setStringList('cartData', cartItems);

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => AdminNotificationScreen()),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                  elevation: 0,
                  backgroundColor: const Color(0xBB53575D),
                  minimumSize:  const Size(340, 45),
                  shape:
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child:Text(
                  'Total: Rs ${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

            ),
          ),

        ],

      ),
    );
  }
}