import 'package:flutter/material.dart';

class CartCustomWidget extends StatefulWidget {
  final List<Map<String, dynamic>> selectedItems;

  CartCustomWidget({required this.selectedItems});

  @override
  _CartCustomWidgetState createState() => _CartCustomWidgetState();
}

class _CartCustomWidgetState extends State<CartCustomWidget> {
  double total = 0.0;

  @override
  void initState() {
    super.initState();
    calculateTotal();
  }

  void calculateTotal() {
    total = 0.0;
    for (final item in widget.selectedItems) {
      final price = item['price'] as double;
      final quantity = item['quantity'] as int;
      total += price * quantity;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.selectedItems.length,
      itemBuilder: (BuildContext context, int index) {
        final item = widget.selectedItems[index];
        final title = item['title'] as String;
        final size = item['size'] as String;
        final price = item['price'] as double;
        final quantity = item['quantity'] as int;

        return ListTile(
          leading: Image.network(item['image'] as String),
          title: Text(title),
          subtitle: Text('Size: $size\nQuantity: $quantity'),
          trailing: Text('\$$price'),
        );
      },
    );
  }
}
