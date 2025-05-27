import 'package:flutter/foundation.dart';

class Product{
  late int productID;
  late String productName;
  late String productBand;
  late String category;
  late double price;
  late String productImage;
  late String description;
  late double discountPercentage;
  late int quantityAvailable;

Product({
  required this.productID,
  required this.productName,
  required this.productBand,
  required this.category,
  required this.price,
  required this.productImage,
  required this.description,
  required this.discountPercentage,
  required this. quantityAvailable,
});
}

