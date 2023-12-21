import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/constants/routes.dart';
import 'package:ecommerce_app/firebase_helper/firebase_firestore_helper.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/screens/category_view.dart';
import 'package:ecommerce_app/screens/product_details.dart';
import 'package:ecommerce_app/widgets/top_titles.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoryList = [];
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
    categoryList = await FirebaseFirestoreHelper.instance.getCategories();
    topProductList = await FirebaseFirestoreHelper.instance.getTopProductList();
    topProductList.shuffle();
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
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TopTitles(title: 'E-Commerce', subtitle: ''),
                          TextFormField(
                            decoration:
                                const InputDecoration(hintText: 'Search....'),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            'Categories',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    categoryList.isEmpty
                        ? const Center(
                            child: Text('Category is empty'),
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: categoryList.map((imageUrl) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Routes.instance.push(
                                          CategoryView(categoryModel: imageUrl),
                                          context);
                                    },
                                    child: Card(
                                      color: Colors.white,
                                      elevation: 3.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Image.network(
                                          imageUrl.image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                    const Padding(
                      padding: EdgeInsets.only(top: 12.0, left: 12.0),
                      child: Text(
                        'Top Products',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
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
                                                disabledForegroundColor: Colors
                                                    .red
                                                    .withOpacity(0.38),
                                                side: const BorderSide(
                                                    color: Colors.red,
                                                    width: 1.7),
                                              ),
                                              child: const Text(
                                                'Buy',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              )),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                    const SizedBox(
                      height: 12,
                    )
                  ],
                ),
              ));
  }
}

/*final categoryList = [
//tech
  "https://free-vectors.net/_ph/10/87455441.jpg",
//groceries
  "https://thumbs.dreamstime.com/z/groceries-paper-bag-modern-flat-style-realistic-vector-illustration-isolated-white-background-69723449.jpg?w=768",
//food
  "https://static.vecteezy.com/system/resources/previews/000/964/198/large_2x/fast-food-meal-set-vector.jpg",
//clothing
  "https://d2gg9evh47fn9z.cloudfront.net/1600px_COLOURBOX37214917.jpg",
//book
  "https://img.freepik.com/free-psd/realistic-book-cover-presentation_1310-24.jpg?w=740&t=st=1700927751~exp=1700928351~hmac=bb77298313070be4e99717ce3925834b7b2728344440423bb62f490307a9e4e8",
//cosmetics
  "https://img.freepik.com/free-vector/cosmetic-product-background_1268-1385.jpg?w=740&t=st=1700921599~exp=1700922199~hmac=c7fa1ffea384ced256f5390044d5e544d5690d15d60680b0ffc370a495112821",
//toys
  "https://img.freepik.com/free-vector/font-design-word-toy-shop-with-many-toys-white-background_1308-42186.jpg?w=740&t=st=1700921909~exp=1700922509~hmac=7c5e83628cc9a61e874af7ad7f4f0775ddf7d4232b8cd535a1ed22b4c78627d3",
];*/
