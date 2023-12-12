import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Image.network(widget.singleProduct.image),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.singleProduct.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        widget.singleProduct.isFavourite =
                            !widget.singleProduct.isFavourite;
                      });
                    },
                    icon: Icon(widget.singleProduct.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border_sharp)),
              ],
            ),
            Text(widget.singleProduct.description),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (qty >= 1) {
                      setState(() {
                        qty--;
                      });
                      //print('Decreasing quantity: $qty');
                    }
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  qty.toString(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      qty++;
                    });
                    //print('Increasing quantity: $qty');
                  },
                  child: const Icon(Icons.add),
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
                  onPressed: () {},
                  child: const Text(
                    'ADD TO CART',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('BUY'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
