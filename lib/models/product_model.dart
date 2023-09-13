class ProductModel {
  final String name;
  final String description;
  final int price;
  final String image;
  bool inCart;

  ProductModel({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.inCart,
  });
}
