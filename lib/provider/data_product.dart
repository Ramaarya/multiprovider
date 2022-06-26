import 'package:flutter/material.dart';
import 'dart:math';
import './product.dart';

class DataProduct with ChangeNotifier {
  final List<Product> _dataProduct = List.generate(
    20,
    (index) {
      return Product(
        id: 'Id ${index + 1}',
        title: 'Product ${index + 1}',
        description: 'Ini Deskripsi Produk ${index + 1}',
        price: 10 + Random().nextInt(100).toDouble(),
        imageUrl: 'https://picsum.photos/id/$index/300',
      );
    },
  );

  List<Product> get dataProduct {
    return [..._dataProduct];
  }

  Product findById(productId) {
    return _dataProduct.firstWhere((prodId) => prodId.id == productId);
  }
}
