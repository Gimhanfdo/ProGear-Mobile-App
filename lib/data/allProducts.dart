import 'package:progear_app/models/product.dart';

class Allproducts {
  static List<Product> discountedProducts = [
    Product(
      productName: 'Kookaburra Ultimate Bat',
      productBrand: 'Kookaburra',
      category: 'Bat',
      price: 130000,
      productImage:
          'https://commercebuild-175c7.kxcdn.com/cdn-d03d5231-5b2e278c.commercebuild.com/cf738e9579802e6b988bb225ca6bc00c/contents/2A25190C/thumbnail/middle_2A25190C-Ghost-Pro-Shadow.jpg?quality=65',
      description: 'Recommended for professional cricketers',
      discountPercentage: 10,
      quantityAvailable: 10,
    ),

    Product(
      productName: 'New Balance TC 1260',
      productBrand: 'New Balance',
      category: 'Bat',
      price: 132000,
      productImage: 'https://m.media-amazon.com/images/I/41pwCXcyd3L.jpg',
      description: 'High-quality bat for all players.',
      discountPercentage: 5,
      quantityAvailable: 20,
    ),

    Product(
      productName: 'SG Bouncer Leather Ball (Red)',
      productBrand: 'SG',
      category: 'Ball',
      price: 5472,
      productImage:
          'https://shop.teamsg.in/cdn/shop/files/1_17c95107-a7f4-4054-8739-1d8b39d584a4.png?v=1720243084&width=1946',
      description:
          'A four-piece leather ball designed to perform well on bouncier pitches, offering good seam and bounce.',
      discountPercentage: 5,
      quantityAvailable: 35,
    ),

    Product(
      productName: 'Shrey Masterclass Air 2.0 Steel Helmet',
      productBrand: 'Shrey',
      category: 'Helmet',
      price: 45000,
      productImage: 'https://kingsgrovesports.com.au/cdn/shop/products/masterclass-air-2.0-titanium-black_400x.jpg?v=1569212722',
      description: 'A professional-grade helmet with a strong steel grille, known for comfort and advanced airflow.',
      discountPercentage: 5,
      quantityAvailable: 20,
    ),
  ];
}
