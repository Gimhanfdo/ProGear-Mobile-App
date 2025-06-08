import 'package:flutter/material.dart';
import 'package:progear_app/data/customerCart.dart';
import 'package:progear_app/models/cartProduct.dart';
import 'package:progear_app/models/product.dart';
import 'package:provider/provider.dart';

class CartProductCard extends StatelessWidget {
  final CartProduct cartProduct;

  const CartProductCard({super.key, required this.cartProduct});

  bool hasDiscount(Product product) {
    return product.discountPercentage != null;
  }

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

    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(product.productImage),
      ),
      title: Text(product.productName, style: TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('LKR ${totalPrice.toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.bold),),
          Text('Unit Price: LKR ${unitPrice.toStringAsFixed(2)}'),
          Text('Quantity: $quantity'),
        ],
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_outline, color: Colors.red),
        onPressed: () {
          context.read<CustomerCart>().removeProductFromCart(product.productID);
        },
      ),
    );
  }
}
