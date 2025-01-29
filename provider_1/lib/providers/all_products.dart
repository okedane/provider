import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider_1/model/product.dart';

class AllProducts with ChangeNotifier {
  List<Product> _allproducts = List.generate(
    25,
    (index) {
      return Product(
        id: "id_${index + 1}",
        title: "Product ${index + 1}",
        description: 'Ini adalah deskripsi produk ${index + 1}',
        price: 10 + Random().nextInt(100).toDouble(),
        imageUrl: 'https://picsum.photos/id/$index/200/300',
      );
    },
  );

  List<Product> get allproducts {
    return [..._allproducts];
  }

  Product findById(String id) {
    return _allproducts.firstWhere((element) => element.id == id);
  }
}
