class Product{
  int productID;
  String productName;
  String productBrand;
  String category;
  double price;
  String productImage;
  String description;
  double? discountPercentage;
  int quantityAvailable;

Product({
  required this.productID,
  required this.productName,
  required this.productBrand,
  required this.category,
  required this.price,
  required this.productImage,
  required this.description,
  this.discountPercentage,
  required this.quantityAvailable,
});
}

