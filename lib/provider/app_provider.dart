import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/firebase_helper/firebase_firestore_helper.dart';
import 'package:ecommerce_app/firebase_helper/firebase_storage_helper.dart';
import 'package:ecommerce_app/models/user_model.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class AppProvider extends ChangeNotifier {
  ////cart
  final List<ProductModel> _cartProductList = [];

  void addCartProduct(ProductModel productModel) {
    _cartProductList.add(productModel);
    notifyListeners();
  }

  void removeCartProduct(ProductModel productModel) {
    _cartProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> getCartProductList() => _cartProductList;

  ////favourite

  final List<ProductModel> _favouriteProductList = [];

  void addFavouriteProduct(ProductModel productModel) {
    _favouriteProductList.add(productModel);
    notifyListeners();
  }

  void removeFavouriteProduct(ProductModel productModel) {
    _favouriteProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> getFavouriteProductList() => _favouriteProductList;

  ////user info

  UserModel? _userModel;

  UserModel get getUserInfo => _userModel!;

  void getUserInfoFirebase() async {
    _userModel = await FirebaseFirestoreHelper.instance.getUserInfo();
    notifyListeners();
  }

  void updateUserInfoFirebase(
      BuildContext context, UserModel userModel, File? file) async {
    showLoaderDialog(context);
    if (file == null) {
      _userModel = userModel;
      await FirebaseFirestore.instance
          .collection("users")
          .doc(_userModel!.id)
          .set(_userModel!.toJson());
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.of(context).pop();
    } else {
      String imageUrl =
          await FirebaseStorageHelper.instance.uploadUserImage(file);
      _userModel = userModel.copyWith(image: imageUrl);
      await FirebaseFirestore.instance
          .collection("users")
          .doc(_userModel!.id)
          .set(_userModel!.toJson());
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.of(context).pop();
    }
    showMessage('Successfully updated profile');

    notifyListeners();
  }
}
