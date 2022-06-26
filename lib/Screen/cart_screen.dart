import 'package:clone_state_management/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Total : \$ ${cartData.totalAmount}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartData.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${cartData.items.values.toList()[index].title}'),
                  subtitle: Text(
                      'Quantity : ${cartData.items.values.toList()[index].qty}'),
                  trailing: Container(
                    child: Text(
                        '\$ ${cartData.items.values.toList()[index].price}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
