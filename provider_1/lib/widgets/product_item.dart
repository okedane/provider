import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../screens/product_detail_screen.dart';
import '../providers/cart_provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final productItem = Provider.of<Product>(context, listen: false);
    final cartItem = Provider.of<CartProvider>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, item, _) => IconButton(
              icon: Icon(
                  item.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Colors.amber,
              onPressed: () {
                item.toggleFavorite();
              },
            ),
          ),
          title: Text(
            productItem.title ?? 'No Title',
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Add to Cart"),
                  duration: Duration(
                    microseconds: 500,
                  ),
                ),
              );
              cartItem.AddCart(
                productItem.id ?? '',
                productItem.price ?? 0.0,
                productItem.title ?? 'No Title',
              );
            },
            color: Colors.amber,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: productItem.id,
            );
          },
          child: Image.network(
            productItem.imageUrl ?? 'No Image',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
