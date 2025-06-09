import 'package:flutter/material.dart';
import 'package:progear_app/data/customerCart.dart';
import 'package:progear_app/models/cartProduct.dart';
import 'package:progear_app/models/product.dart';
import 'package:provider/provider.dart';

class CartProductCard extends StatelessWidget {
  // The CartProduct object that contains the product and its quantity
  final CartProduct cartProduct;

  //Constructor
  const CartProductCard({super.key, required this.cartProduct});

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

    //Returns true if the product has a discount
    final bool isDiscounted = hasDiscount(product);

    //Sets the unit price to discounted price or product price accordingly
    final double unitPrice =
        isDiscounted ? calculateDiscountedPrice(product) : product.price;

    //Calculate the total price of the item
    final double totalPrice = unitPrice * quantity;

    // a ListTile widget showing product details and delete icon
    return ListTile(
      leading: CircleAvatar( //Product image
        radius: 30,
        backgroundImage: NetworkImage(product.productImage),
      ),
      title: Text(product.productName, style: TextStyle(fontWeight: FontWeight.bold),), //Product name
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ //Product price
          Text('LKR ${totalPrice.toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.bold),),
          Text('Unit Price: LKR ${unitPrice.toStringAsFixed(2)}'),
          Text('Quantity: $quantity'),
        ],
      ),
      trailing: IconButton( //Delete icon
        icon: Icon(Icons.delete_outline, color: Colors.red),
        onPressed: () {
          context.read<CustomerCart>().removeProductFromCart(product.productID);
        },
      ),
    );
  }
}
