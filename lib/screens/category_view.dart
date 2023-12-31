import 'package:ecommerce_app/constants/routes.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/screens/product_details.dart';
import 'package:flutter/material.dart';

import '../firebase_helper/firebase_firestore_helper.dart';
import '../models/product_model.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;

  const CategoryView({super.key, required this.categoryModel});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<ProductModel> topProductList = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    getCategoryList();
    super.initState();
  }

  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    topProductList = await FirebaseFirestoreHelper.instance
        .getCategoryViewProduct(widget.categoryModel.id);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? Center(
          child: Container(
            height: 100,
            width: 100,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          ),
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: kToolbarHeight * 1,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  const BackButton(),
                  Text(
                    widget.categoryModel.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
            topProductList.isEmpty
                ? const Center(
              child: Text('Top products is empty'),
            )
                : Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: topProductList.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (ctx, index) {
                    final singleProduct = topProductList[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.network(
                              singleProduct.image,
                              height: 100,
                              width: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            singleProduct.name,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('Price: ${singleProduct.price}'),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 45,
                            width: 140,
                            child: OutlinedButton(
                                onPressed: () {
                                  Routes.instance.push(
                                      ProductDetails(
                                          singleProduct:
                                          singleProduct),
                                      context);
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.red,
                                  disabledForegroundColor:
                                  Colors.red.withOpacity(0.38),
                                  side: const BorderSide(
                                      color: Colors.red,
                                      width: 1.7),
                                ),
                                child: const Text(
                                  'Buy',
                                  style:
                                  TextStyle(color: Colors.red),
                                )),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}