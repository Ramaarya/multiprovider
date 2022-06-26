import 'package:clone_state_management/provider/data_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/grid_card.dart';

class GridViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<DataProduct>(context);

    final allProduct = productData.dataProduct;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 20,
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: allProduct[i],
        child: GridCard(),
      ),
    );
  }
}
