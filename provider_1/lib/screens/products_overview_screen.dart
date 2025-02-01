import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_1/providers/cart_provider.dart';

import '../screens/cart_screen.dart';
import '../widgets/badge_widget.dart';
import '../widgets/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          Consumer<CartProvider>(
            builder: (context, value, ch) {
              return Badge_Widget(
                value: value.jumlah.toString(),
                color: Colors.amber,
                child: ch ?? SizedBox.shrink(),
              );
            },
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      body: Product_Grid(),
    );
  }
}
