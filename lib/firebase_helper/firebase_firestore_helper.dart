import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/models/product_model.dart';

import '../models/category_model.dart';

class FirebaseFirestoreHelper {
  static FirebaseFirestoreHelper instance = FirebaseFirestoreHelper();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore.collection("categories").get();
      List<CategoryModel> categoryList = querySnapshot.docs
          .map((e) => CategoryModel.fromJson(e.data()))
          .toList();
      return categoryList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> getTopProductList() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore.collectionGroup("products").get();
      List<ProductModel> topProductList = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();
      return topProductList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> getCategoryViewProduct(String categoryId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore
              .collection("categories")
              .doc(categoryId)
              .collection("products")
              .get();

      List<ProductModel> topProductList = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();

      return topProductList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }
}
