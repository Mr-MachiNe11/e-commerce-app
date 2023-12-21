import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/constants/routes.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/provider/app_provider.dart';
import 'package:ecommerce_app/screens/cart.dart';
import 'package:ecommerce_app/screens/favourite_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel singleProduct;

  const ProductDetails({super.key, required this.singleProduct});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Routes.instance.push(const Cart(), context);
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 400,
              width: 400,
              child: Image.network(widget.singleProduct.image),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.singleProduct.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.singleProduct.isFavourite =
                          !widget.singleProduct.isFavourite;
                    });
                    if (widget.singleProduct.isFavourite) {
                      appProvider.addFavouriteProduct(widget.singleProduct);
                    } else {
                      appProvider.removeFavouriteProduct(widget.singleProduct);
                    }
                  },
                  icon: Icon(
                    appProvider
                            .getFavouriteProductList()
                            .contains(widget.singleProduct)
                        ? Icons.favorite
                        : Icons.favorite_border_sharp,
                  ),
                ),
              ],
            ),
            Text(widget.singleProduct.description),
            const SizedBox(height: 16),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    if (qty >= 1) {
                      setState(() {
                        qty--;
                      });
                    }
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Icon(Icons.remove, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  qty.toString(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 12),
                InkWell(
                  onTap: () {
                    setState(() {
                      qty++;
                    });
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: Colors.red),
                    ),
                  ),
                  onPressed: () {
                    ProductModel productModel =
                        widget.singleProduct.copyWith(qty: qty);
                    appProvider.addCartProduct(productModel);
                    showMessage('Added to Cart');
                  },
                  child: const Text(
                    'ADD TO CART',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                SizedBox(
                  width: 130,
                  child: ElevatedButton(
                    onPressed: () {
                      Routes.instance.push(
                        const FavouriteScreen(),
                        context,
                      );
                    },
                    child: const Text('BUY'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
