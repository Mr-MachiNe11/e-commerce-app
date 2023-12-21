import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../provider/app_provider.dart';

class SingleFavouriteItem extends StatefulWidget {
  final ProductModel singleProduct;

  const SingleFavouriteItem({super.key, required this.singleProduct});

  @override
  State<SingleFavouriteItem> createState() => _SingleFavouriteItemState();
}

class _SingleFavouriteItemState extends State<SingleFavouriteItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red, width: 3),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 140,
              color: Colors.red.withOpacity(0.5),
              child: Image.network(widget.singleProduct.image),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 140,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.singleProduct.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CupertinoButton(
                            onPressed: () {
                              AppProvider appProvider =
                                  Provider.of<AppProvider>(context,
                                      listen: false);
                              appProvider
                                  .removeFavouriteProduct(widget.singleProduct);
                              showMessage('Removed from wishlist');
                            },
                            padding: EdgeInsets.zero,
                            child: const Text(
                              'Remove from wishlist',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${widget.singleProduct.price}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
