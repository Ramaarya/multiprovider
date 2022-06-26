import 'package:clone_state_management/provider/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clone_state_management/Screen/detail_product.dart';
import '../provider/product.dart';
import '../provider/cart.dart';

class GridCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, productData, child) => IconButton(
              onPressed: () {
                productData.statusFavorite();
              },
              icon: (productData.isFavorite)
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(Icons.favorite_border_rounded),
            ),
          ),
          title: Text(
            productData.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Add to Cart'),
                  duration: Duration(seconds: 1),
                ),
              );
              cart.addCart(
                productData.id,
                productData.title,
                productData.price,
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              DetailProductScreen.routeName,
              arguments: productData.id,
            );
          },
          child: Image.network(
            productData.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
