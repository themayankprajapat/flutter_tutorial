import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  List<ProductModel> products = List.generate(
    16,
    (index) => ProductModel(
      name: 'Product ${index + 1}',
      image: "https://picsum.photos/id/${250 + index}/200/300",
      price: 200 + index,
      description: 'This is new Product for your ease',
      inCart: false,
    ),
  );

  List<ProductModel> cartProducts = [];

  void addToCart(ProductModel product) {
    cartProducts.add(product);
    notifyListeners();
  }

  void removeFromCart(int index) {
    cartProducts.removeAt(index);
    notifyListeners();
  }
}
