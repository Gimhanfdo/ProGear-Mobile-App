import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:progear_app/data/customerCart.dart';
import 'package:progear_app/models/product.dart';
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
                  Text("Added to cart successfully.", style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 20),
                  Text("Product: ${widget.product.productName}"),
                  const SizedBox(height: 10,),
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

    Widget productDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.product.productName,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
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
              color: theme.colorScheme.onSurface.withAlpha(153), // 60% opacity
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
            backgroundColor: Colors.teal.shade600,
          ),
          child: Text(
            'Add to Cart',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );

    Widget productDescription = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          widget.product.description,
          style: TextStyle(
            fontSize: 16,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        Divider(color: theme.colorScheme.inversePrimary, thickness: 1),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text(widget.product.productName),
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
                  ],
                ),
      ),
    );
  }
}
