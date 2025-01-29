import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_1/providers/all_products.dart';
import 'package:provider_1/widgets/product_item.dart';

class Product_Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<AllProducts>(context);
    final all_product = productData.allproducts;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: all_product.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: all_product[i],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
