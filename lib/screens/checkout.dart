import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:progear_app/data/customerCart.dart';
import 'package:progear_app/models/cartProduct.dart';
import 'package:progear_app/screens/navigationWrapper.dart';
import 'package:progear_app/screens/shared/checkoutProductCard.dart';
import 'package:progear_app/screens/shared/errorAlertDialog.dart';
import 'package:progear_app/screens/shared/textField.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final formKey = GlobalKey<FormState>();
  final shippingAddressController = TextEditingController();
  final creditCardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cvvController = TextEditingController();

  String paymentMethod = 'COD';
  String cardType = 'Mastercard';

  bool cardDetailsValidated(BuildContext context) {
    final creditCardNumber = creditCardNumberController.text;
    final expiryDate = expiryDateController.text;
    final cvv = cvvController.text;

    //Empty field validation
    if (creditCardNumber.isEmpty || expiryDate.isEmpty || cvv.isEmpty) {
      showErrorAlertDialog(
        context,
        'Empty fields found. Please check and try again.',
      );
      return false;
    }

    //Credit card number validation
    if (!RegExp(r'^\d{16}$').hasMatch(creditCardNumber)) {
      showErrorAlertDialog(
        context,
        'Credit card number must contain exactly 16 digits.',
      );
      return false;
    }

    //CVV validation
    if (!RegExp(r'^\d{3}$').hasMatch(cvv)) {
      showErrorAlertDialog(context, 'CVV must contain exactly 3 digits.');
      return false;
    }
    return true;
  }

  void displayOrderSuccess(BuildContext context) {
    final shippingAddress = shippingAddressController.text;
    if (shippingAddress.isNotEmpty) {
      if (cardDetailsValidated(context) || paymentMethod == 'COD') {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder:
              (context) => AlertDialog(
                title: Text("PROGEAR"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order placed successfully."),
                    Text(
                      "Thank you for shopping with PROGEAR",
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      // Navigate to Home screen
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavigationWrapper(),
                        ),
                      );
                    },
                    child: Text("OK"),
                  ),
                ],
              ),
        );
      }
      return;
    }
    showErrorAlertDialog(context, 'Please enter a shipping address.');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenOrientation = MediaQuery.of(context).orientation;

    Widget sectionTitle(String title, ThemeData theme) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Divider(color: theme.colorScheme.inversePrimary, thickness: 1),
          const SizedBox(height: 10),
        ],
      );
    }

    return Consumer<CustomerCart>(
      builder: (context, cart, child) {
        final List<CartProduct> cartItems = cart.getCart.values.toList();

        Widget checkoutForm = Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sectionTitle("Delivery Details", theme),
              CustomTextField(
                labelText: 'Shipping Address',
                textController: shippingAddressController,
                hintText: 'Enter your shipping address',
                obscureText: false,
              ),
              const SizedBox(height: 20),
              sectionTitle("Payment Information", theme),
              Text(
                'Select your preferred method of payment',
                style: TextStyle(fontSize: 18),
              ),
              Row(
                children: [
                  Radio(
                    value: 'COD',
                    groupValue: paymentMethod,
                    onChanged:
                        (value) => setState(() {
                          paymentMethod = value.toString();
                        }),
                  ),
                  const SizedBox(width: 3),
                  Text('Cash on Delivery'),
                  const SizedBox(width: 5),
                  Radio(
                    value: 'Card',
                    groupValue: paymentMethod,
                    onChanged:
                        (value) => setState(() {
                          paymentMethod = value.toString();
                        }),
                  ),
                  const SizedBox(width: 3),
                  Text('Card Payment'),
                ],
              ),
              if (paymentMethod == 'Card') ...[
                Text(
                  'Please enter your card details',
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  children: [
                    Radio(
                      value: 'Mastercard',
                      groupValue: cardType,
                      onChanged:
                          (value) => setState(() {
                            cardType = value.toString();
                          }),
                    ),
                    const SizedBox(width: 3),
                    Image.asset('assets/images/icons8-mastercard-48.png'),
                    const SizedBox(width: 5),
                    Radio(
                      value: 'Visa',
                      groupValue: cardType,
                      onChanged:
                          (value) => setState(() {
                            cardType = value.toString();
                          }),
                    ),
                    const SizedBox(width: 3),
                    Image.asset('assets/images/icons8-visa-48.png'),
                  ],
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  labelText: 'Credit Card Number',
                  textController: creditCardNumberController,
                  hintText: 'XXXX-XXXX-XXXX-XXXX',
                  obscureText: false,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  labelText: 'Expiry Date',
                  textController: expiryDateController,
                  hintText: 'mm/dd/yyyy',
                  obscureText: false,
                  onTap: () async {
                    final expiryDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100, 12, 31),
                    );
                    if (expiryDate != null) {
                      expiryDateController.text = DateFormat(
                        'MM/yy',
                      ).format(expiryDate);
                    }
                  },
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  labelText: 'CVV',
                  textController: cvvController,
                  hintText: '',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
              ],
            ],
          ),
        );

        Widget orderSummary = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle("Order Summary", theme),
            ...cartItems
                .map((item) => CheckoutProductCard(cartProduct: item))
                .toList(),
            Divider(color: theme.colorScheme.inversePrimary, thickness: 1),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Column(
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
                      displayOrderSuccess(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal.shade700,
                    ),
                    child: Text(
                      'Confirm and Place Order',
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
        );

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('Review Order'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                screenOrientation == Orientation.landscape
                    ? Row(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(child: checkoutForm),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: SingleChildScrollView(child: orderSummary),
                        ),
                      ],
                    )
                    : ListView(
                      children: [
                        checkoutForm,
                        const SizedBox(height: 10),
                        orderSummary,
                      ],
                    ),
          ),
        );
      },
    );
  }
}
