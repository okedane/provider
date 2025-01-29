import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: item.id,
            );
          },
          child: Image.network(
            item.imageUrl ?? 'No Image',
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon:
                Icon(item.isFavorite ? Icons.favorite : Icons.favorite_border),
            color: Colors.amber,
            onPressed: () {
              item.toggleFavorite();
            },
          ),
          title: Text(
            item.title ?? 'No Title',
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
