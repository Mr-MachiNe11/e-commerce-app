import 'package:flutter/foundation.dart';

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

  //favourite

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

}
