import 'package:flutter/material.dart';
import 'package:progear_app/models/cartProduct.dart';
import 'package:progear_app/models/product.dart';

class CustomerCart extends ChangeNotifier {
  // Static map to hold cart items
  static Map<int, CartProduct> cart = {};

  //Getter to access the cart
  Map<int, CartProduct> get getCart => cart;

  //Add to cart method
  void addToCart(Product product, int quantity) {
    if (cart.containsKey(product.productID)) {
      cart[product.productID]!.quantity += quantity; //Increase qty if product exists
    } 
    else {
      //Add new cartProduct to the cart 'map'
      cart[product.productID] = CartProduct(
        product: product,
        quantity: quantity,
      );
    }

    //Notify listeners for UI updates
    notifyListeners();
  }

  //Remove product from cart
  void removeProductFromCart(int productID) {
    cart.remove(productID);

    notifyListeners();
  }

  //Calculate sub total
  double get subTotal{
    double total = 0;
    cart.forEach((_, cartProduct){
      total += cartProduct.product.price * cartProduct.quantity;
    });
    return total;
  }

  //Calculate discounted total
  double get discountedTotal{
    double newTotal = 0;
    cart.forEach((_, cartProduct){
      //Calculate unit price for each cart item
      final unitPrice = cartProduct.product.discountPercentage != null
        ? cartProduct.product.price * (1 - cartProduct.product.discountPercentage! / 100)
        : cartProduct.product.price;

      newTotal += unitPrice * cartProduct.quantity;
    });
    return newTotal;
  }

  //Calculate VAT
  double get vatValue{
    double vat = discountedTotal * 0.18;
    return vat;
  }

  //Calculate total with VAT
  double get taxedTotal{
    double total = discountedTotal + vatValue;
    return total;
  }
}
