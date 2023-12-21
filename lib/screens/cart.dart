import 'package:ecommerce_app/widgets/single_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/app_provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int qty = 0;

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    final cartProductList = appProvider.getCartProductList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: cartProductList.isEmpty
          ? const Center(
              child: Text('Empty'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12.0),
              itemCount: cartProductList.length,
              itemBuilder: (context, index) {
                return SingleCartItem(singleProduct: cartProductList[index]);
              },
            ),
    );
  }
}
