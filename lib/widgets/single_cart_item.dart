import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../provider/app_provider.dart';

class SingleCartItem extends StatefulWidget {
  final ProductModel singleProduct;

  const SingleCartItem({super.key, required this.singleProduct});

  @override
  State<SingleCartItem> createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  int qty = 1;

  @override
  void initState() {
    qty = widget.singleProduct.qty ?? 1;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    final favouriteProductList = appProvider.getFavouriteProductList();

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
                              child: const Padding(
                                padding: EdgeInsets.only(top: 10, right: 5),
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  // Set background color to red
                                  maxRadius: 13,
                                  child: Icon(Icons.remove,
                                      color: Colors
                                          .white), // Set icon color to white
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                qty.toString(),
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  qty++;
                                });
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(left: 5, top: 10),
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  maxRadius: 13,
                                  child: Icon(Icons.add, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CupertinoButton(
                            onPressed: () {
                              if (!favouriteProductList
                                  .contains(widget.singleProduct)) {
                                appProvider
                                    .addFavouriteProduct(widget.singleProduct);
                              } else {
                                appProvider.removeFavouriteProduct(
                                    widget.singleProduct);
                              }
                            },
                            padding: EdgeInsets.zero,
                            child: Text(
                              favouriteProductList
                                      .contains(widget.singleProduct)
                                  ? 'Remove from wishlist'
                                  : 'Add to wishlist',
                              style: const TextStyle(
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
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: const CircleAvatar(
                            backgroundColor: Colors.red,
                            maxRadius: 13,
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          onPressed: () {
                            AppProvider appProvider = Provider.of<AppProvider>(
                                context,
                                listen: false);
                            appProvider.removeCartProduct(widget.singleProduct);
                            showMessage('Removed from Cart');
                          },
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
