import 'package:flutter/material.dart';
import 'package:progear_app/data/customerCart.dart';
import 'package:progear_app/models/cartProduct.dart';
import 'package:progear_app/screens/checkout.dart';
import 'package:progear_app/screens/shared/cartProductCard.dart';
import 'package:progear_app/screens/shared/customHomeAppBar.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerCart>(
      builder: (context, cart, child) {
        final List<CartProduct> cartItems = cart.getCart.values.toList();
        final screenOrientation = MediaQuery.of(context).orientation;

        return Scaffold(
          appBar:
              screenOrientation == Orientation.landscape
                  ? null
                  : CustomHomeAppBar(), //Hide the app bar in the landscape view
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    return CartProductCard(cartProduct: cartItems[index]);
                  },
                ),
              ),
              if (cartItems.isNotEmpty)
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal.shade100),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sub Total', style: TextStyle(fontSize: 18)),
                          Text(
                            'LKR ${cart.discountedTotal.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('VAT (18%)', style: TextStyle(fontSize: 18)),
                          Text(
                            'LKR ${cart.vatValue.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[700],
                            ),
                          ),
                          Text(
                            'LKR ${cart.taxedTotal.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[700],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CheckoutPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal.shade700,
                        ),
                        child: Text(
                          'Proceed to Checkout',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
