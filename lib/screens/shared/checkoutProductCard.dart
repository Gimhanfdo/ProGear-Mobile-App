// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:progear_app/models/cartProduct.dart';
import 'package:progear_app/models/product.dart';

class CheckoutProductCard extends StatelessWidget {
  // The CartProduct object that contains the product and its quantity
  final CartProduct cartProduct;

  //Constructor
  const CheckoutProductCard({super.key, required this.cartProduct});

  //Method to check if the product has a discount
  bool hasDiscount(Product product) {
    return product.discountPercentage != null;
  }

  //Method to calculate discount
  double calculateDiscountedPrice(Product product) {
    return product.price * (1 - product.discountPercentage! / 100);
  }

  @override
  Widget build(BuildContext context) {
    final product = cartProduct.product;
    final quantity = cartProduct.quantity;

    final bool isDiscounted = hasDiscount(product);
    final double unitPrice =
        isDiscounted ? calculateDiscountedPrice(product) : product.price;

    final double totalPrice = unitPrice * quantity;

    // Build the card object for displaying product
    return Card(
      elevation: 3, //Shadow
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6), // Outer spacing
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(product.productImage),
        ),
        title: Text(
          product.productName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'LKR ${totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Unit Price: LKR ${unitPrice.toStringAsFixed(2)}'),
            Text('Quantity: $quantity'),
          ],
        ),
      ),
    );
  }
}
