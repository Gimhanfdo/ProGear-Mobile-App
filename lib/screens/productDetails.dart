// ignore_for_file: file_names, deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:progear_app/data/allProducts.dart';
import 'package:progear_app/data/customerCart.dart';
import 'package:progear_app/models/product.dart';
import 'package:progear_app/screens/cart.dart';
import 'package:progear_app/screens/shared/errorAlertDialog.dart';
import 'package:progear_app/screens/shared/productCard.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool get isProductOutofStock => widget.product.quantityAvailable == 0;
  bool get isProductLimitedStock =>
      widget.product.quantityAvailable <= 5 &&
      widget.product.quantityAvailable > 0;

  Text get stockAvailabilityStatus {
    if (isProductOutofStock) {
      return Text(
        'Out of Stock',
        style: TextStyle(color: Colors.red, fontSize: 18),
      );
    } else if (isProductLimitedStock) {
      return Text(
        'Limited Stock Available',
        style: TextStyle(color: Colors.deepOrange, fontSize: 18),
      );
    } else {
      return Text(
        'In Stock',
        style: TextStyle(color: Colors.green, fontSize: 18),
      );
    }
  }

  bool hasDiscount(Product product) {
    return product.discountPercentage != null;
  }

  double calculateDiscountedPrice(Product product) {
    return product.price * (1 - product.discountPercentage! / 100);
  }

  int quantityCount = 0;

  //Decrease product quantity
  void decreaseQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  //Increase product quantity
  void increaseQuantity() {
    setState(() {
      if (quantityCount < widget.product.quantityAvailable) {
        quantityCount++;
      }
    });
  }

  //Add to Cart
  void addToCart() {
    if (quantityCount > 0) {
      //Get access to customer cart
      final customerCart = context.read<CustomerCart>();

      //Add product to cart
      customerCart.addToCart(widget.product, quantityCount);

      //Display a success message
      showDialog(
        context: context,
        barrierDismissible:
            false, //Prevents closing the dialog box when clicked outsides=
        builder:
            (context) => AlertDialog(
              title: Text('PROGEAR'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Added to cart successfully.",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  Text("Product: ${widget.product.productName}"),
                  const SizedBox(height: 10),
                  Text("Quantity: $quantityCount"),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); //To remove dialog box
                    Navigator.pop(context); //Return to prevous screen
                  },
                  child: Text('OK'),
                ),
              ],
            ),
      );
    }
    else if (quantityCount == 0){
      showErrorAlertDialog(context, 'Select the quantity');
    }
    else if (isProductOutofStock){
      showErrorAlertDialog(context, 'The product is out of stock');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDiscounted = hasDiscount(widget.product);
    final double? discountedPrice =
        isDiscounted ? calculateDiscountedPrice(widget.product) : null;
    final screenOrientation = MediaQuery.of(context).orientation;

    Widget productImage = Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      child: CachedNetworkImage(
        imageUrl: widget.product.productImage,
        fit: BoxFit.contain,
      ),
    );

    Widget productDetails = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.product.productName,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                'Brand: ${widget.product.productBrand} | ',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(width: 2),
              stockAvailabilityStatus,
            ],
          ),
          const SizedBox(height: 10),
          if (isDiscounted) ...[
            //Discounted price
            Text(
              'Rs. ${widget.product.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                color: theme.colorScheme.onSurface.withAlpha(
                  153,
                ), // 60% opacity
                decoration: TextDecoration.lineThrough,
              ),
            ),

            Text(
              'Rs. ${discountedPrice!.toStringAsFixed(2)}',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ] else ...[
            Text(
              'Rs. ${widget.product.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.teal.shade300,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.remove, color: Colors.white),
                  onPressed: decreaseQuantity,
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 40,
                child: Center(
                  child: Text(
                    quantityCount.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.teal.shade300,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.add, color: Colors.white),
                  onPressed: increaseQuantity,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              addToCart();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Theme.of(context).colorScheme.onPrimaryFixedVariant,
            ),
            child: Text(
              'Add to Cart',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );

    Widget productDescription = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            widget.product.description,
            style: TextStyle(
              fontSize: 16,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 5),
          Divider(color: theme.colorScheme.inversePrimary, thickness: 1),
        ],
      ),
    );

    final relatedProducts = Allproducts.getProductsByCategory(
      widget.product.category,
    );

    Widget displayRelatedProducts(List<Product> productList) {
      final screenOrientation = MediaQuery.of(context).orientation;
      final crossAxisCount = screenOrientation == Orientation.landscape ? 3 : 2;
      final childAspectRatio =
          screenOrientation == Orientation.landscape
              ? (100 / 110)
              : (100 / 140);

      return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
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
          return InkWell(
            splashColor: Colors.tealAccent.withOpacity(0.3),
            highlightColor: Colors.transparent,
            child: ProductCard(product: productListItem),
            onTap: () {
              final selectedProduct = productList[index];
              if (selectedProduct != widget.product) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            ProductDetailsPage(product: selectedProduct),
                  ),
                );
              }
            },
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.product.productName),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage()),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child:
            screenOrientation == Orientation.landscape
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: productImage,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(flex: 3, child: productDetails),
                      ],
                    ),
                    const SizedBox(height: 20),
                    productDescription,
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Related Products',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    displayRelatedProducts(relatedProducts),
                  ],
                )
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: productImage),
                    const SizedBox(height: 10),
                    productDetails,
                    const SizedBox(height: 20),
                    productDescription,
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Related Products',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    displayRelatedProducts(relatedProducts),
                  ],
                ),
      ),
    );
  }
}
