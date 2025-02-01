import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/all_products.dart';
import '../providers/cart_provider.dart';
import '../screens/cart_screen.dart';
import '../widgets/badge_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // is the id!
    final productItem = Provider.of<AllProducts>(context).findById(productId);
    final cartItem = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
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
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 250,
            child: Image.network(
              "${productItem.imageUrl}",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 30),
          Text(
            "${productItem.title}",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "\$${productItem.price}",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "${productItem.description}",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Text("${productItem.id}"),
          SizedBox(height: 15),
          OutlinedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Berhasil ditambahkan")));
              cartItem.AddCart(
                productItem.id ?? '',
                productItem.price ?? 0.0,
                productItem.title ?? 'No Title',
              );
            },
            child: Text(
              "Add to Cart",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
