import 'package:flutter/material.dart';
import 'package:progear_app/data/allProducts.dart';
import 'package:progear_app/screens/productDetails.dart';
import 'package:progear_app/screens/shared/customHomeAppBar.dart';
import 'package:progear_app/screens/shared/productCard.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int isSelected = 0;
  //Product Categories
  List productCategories = [
    "Cricket Bats",
    "Cricket Balls",
    "Cricket Helmets",
    "Other Equipment",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHomeAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     "Browse Our Products",
          //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //   ),
          // ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              itemCount: productCategories.length,
              itemBuilder: (context, index) {
                return _productCategory(
                  index: index,
                  categoryName: productCategories[index],
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child:
                isSelected == 0
                    ? _displayProductsByCategory(Allproducts.cricketBats)
                    : isSelected == 1
                    ? _displayProductsByCategory(Allproducts.cricketBalls)
                    : isSelected == 2
                    ? _displayProductsByCategory(Allproducts.cricketHelmets)
                    : _displayProductsByCategory(Allproducts.otherEquipment),
          ),
        ],
      ),
    );
  }

  Widget _productCategory({required int index, required String categoryName}) {
    return GestureDetector(
      onTap: () => setState(() => isSelected = index),
      child: Container(
        width: 100,
        height: 50,
        margin: EdgeInsets.only(top: 10, right: 10),
        padding: EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected == index ? Colors.teal.shade600 : Colors.teal.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(categoryName, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _displayProductsByCategory(List productList) {
    final screenOrientation = MediaQuery.of(context).orientation;
    final crossAxisCount = screenOrientation == Orientation.landscape ? 3 : 2;
    final childAspectRatio =
        screenOrientation == Orientation.landscape ? (100 / 110) : (100 / 140);

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      scrollDirection: Axis.vertical,
      itemCount: productList.length,
      itemBuilder: (context, index) {
        final productListItem = productList[index];
        return GestureDetector(
          child: ProductCard(product: productListItem),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        ProductDetailsPage(productObject: productList[index]),
              ),
            ); //Material Page Route
          },
        );
      },
    );
  }
}
