import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:progear_app/models/product.dart';
import 'package:progear_app/data/allProducts.dart';
import 'package:progear_app/screens/productDetails.dart';
import 'package:progear_app/screens/products.dart';
import 'package:progear_app/screens/profile.dart';
import 'package:progear_app/screens/shared/customHomeAppBar.dart';
import 'package:progear_app/screens/shared/productCard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHomeAppBar(),
      body: 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 150,
                width: double.infinity,
                child: CachedNetworkImage(
                  //For image optimization
                  imageUrl:
                      'https://cms-static.asics.com/media-libraries/109692/file.jpg?1729645527521?20241023213849',
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                  errorWidget:
                      (context, url, error) => const Icon(Icons.broken_image),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Discounted Products',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  Image.asset(
                    'assets/icons/icons8-flash.png',
                    width: 30,
                    height: 30,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height:
                    MediaQuery.of(context).size.height * 0.5, 
                child: _displayDiscountedProducts(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _displayDiscountedProducts() {
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
      itemCount: Allproducts.discountedProducts.length,
      itemBuilder: (context, index) {
        final discountedProduct = Allproducts.discountedProducts[index];
        return GestureDetector(
          child: ProductCard(product: discountedProduct),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => ProductDetailsPage(
                      product: Allproducts.discountedProducts[index],
                    ),
              ),
            ); //Material Page Route
          },
        );
      },
    );
  }
}
