import 'package:progear_app/models/product.dart';

class CartProduct {
  final Product product;
  int quantity;

  CartProduct({required this.product, required this.quantity});
}
