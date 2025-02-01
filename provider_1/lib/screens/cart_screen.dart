import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_1/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Text("Total : \$${cartData.totalHarga}"),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cartData.cartItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title:
                        Text(cartData.cartItems.values.toList()[index].title),
                    subtitle: Text(
                        "${cartData.cartItems.values.toList()[index].qty}"),
                    trailing: Container(
                      child: Text(
                          "\$ ${cartData.cartItems.values.toList()[index].qty * cartData.cartItems.values.toList()[index].price}"),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
