import 'package:flutter/material.dart';
import 'package:progear_app/models/product.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product productObject;
  const ProductDetailsPage({super.key, required this.productObject});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}