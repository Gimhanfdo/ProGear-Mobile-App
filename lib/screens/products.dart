import 'package:flutter/material.dart';
import 'package:progear_app/screens/shared/customHomeAppBar.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHomeAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Browse our Products",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_productCategory()],
          ),
        ],
      ),
    );
  }

  _productCategory() => Container(
    width: 100,
    height: 40,
    margin: EdgeInsets.only(top: 10, right: 10),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.teal,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text("Product Category", style: TextStyle(color: Colors.white)),
  );
}
