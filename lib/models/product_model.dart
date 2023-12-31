// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String id;
  String name;
  String price;
  String description;
  String status;
  bool isFavourite;
  String image;
  int? qty;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.status,
    required this.isFavourite,
    required this.image,
    this.qty,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    name: json["name"] ?? 'yk',
    price: json["price"],
    description: json["description"],
    status: json["status"],
    isFavourite: false,
    image: json["image"],
    qty: json["qty"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "description": description,
    "status": status,
    "isFavourite": isFavourite,
    "image": image,
    "qty": qty,
  };

  ProductModel copyWith({
    int? qty,
  }) =>
      ProductModel(
        id: id,
        name: name,
        price: price,
        description: description,
        status: status,
        isFavourite: isFavourite,
        image: image,
        qty: qty ?? this.qty,
      );
}