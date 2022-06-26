import 'package:flutter/material.dart';

import '../models/cart_item.dart';

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get jumlah {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, CartItem) {
      total += CartItem.qty * CartItem.price;
    });
    return total;
  }

  void addCart(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      // ketika id sudah berisi (menambah qyt)
      _items.update(
          productId,
          (value) => CartItem(
                id: value.id,
                title: value.title,
                price: value.price,
                qty: value.qty + 1,
              ));
    } else {
      // ketika id masih kosong
      _items.putIfAbsent(
          productId,
          () => CartItem(
                id: DateTime.now().toString(),
                title: title,
                price: price,
                qty: 1,
              ));
    }
    notifyListeners();
  }
}
