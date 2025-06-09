import 'package:progear_app/models/product.dart';

//Requires product object and quantity as parameters
class CartProduct {
  final Product product;
  int quantity;

  CartProduct({required this.product, required this.quantity});
}
