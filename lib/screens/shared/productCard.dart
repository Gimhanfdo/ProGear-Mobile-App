import 'package:flutter/material.dart';
import 'package:progear_app/models/product.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  bool hasDiscount(Product product) {
    return product.discountPercentage > 0;
  }

  double calculateDiscountedPrice(Product product) {
    return product.price * (1 - product.discountPercentage / 100);
  }

  @override
  Widget build(BuildContext context) {
    final bool isDiscounted = hasDiscount(product);
    final double? discountedPrice =
        isDiscounted ? calculateDiscountedPrice(product) : null;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[50],
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          //Product Image
          SizedBox(
            height: 130,
            width: 130,
            child: CachedNetworkImage( //For image optimization
              imageUrl: product.productImage,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.broken_image),
            ),
          ),

          //Product Name
          Text(product.productName, style: TextStyle()),

          //Product Price(s) will be displayed accordingly based on their discount
          if (isDiscounted) ...[
            //Discounted price
            Text(
              'Rs. ${product.price.toStringAsFixed(2)}',
              style: TextStyle(
                color: Colors.grey[600],
                decoration: TextDecoration.lineThrough,
              ),
            ),

            Text(
              'Rs. ${discountedPrice!.toStringAsFixed(2)}',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ] else ...[
            Text(
              'Rs. ${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ],
      ),
    );
  }
}
