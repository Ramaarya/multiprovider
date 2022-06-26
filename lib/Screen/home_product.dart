import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/grid_view.dart';
import '../widget/badge.dart';
import '../Screen/cart_screen.dart';
import '../provider/cart.dart';

class HomeProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Online Shop Lite'),
        elevation: 0,
        actions: [
          Consumer<Cart>(
            builder: (context, value, child) {
              return Badge(
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
                value: value.jumlah.toString(),
                color: Colors.yellow,
              );
            },
          ),
        ],
      ),
      body: GridViewScreen(),
    );
  }
}
