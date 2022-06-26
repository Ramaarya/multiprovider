import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Package file on apps
import 'Screen/cart_screen.dart';
import 'Screen/home_product.dart';
import 'Screen/detail_product.dart';
import './provider/cart.dart';
import './provider/data_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataProduct()),
        ChangeNotifierProvider(create: (context) => Cart()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeProductScreen(),
        routes: {
          DetailProductScreen.routeName: (context) =>
              const DetailProductScreen(),
          CartScreen.routeName: (context) => CartScreen(),
        },
      ),
    );
  }
}
