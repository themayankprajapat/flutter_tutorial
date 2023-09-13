import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final _products = List.generate(
    16,
    (index) => ProductModel(
      name: 'Product ${index + 1}',
      image: "https://picsum.photos/id/${250 + index}/200/300",
      price: 200 + index,
      description: 'This is new Product for your ease',
      inCart: false,
    ),
  );

  List<ProductModel> get getProducts => _products;

  List<ProductModel> get cartProducts =>
      _products.where((element) => element.inCart).toList();

  void addToCart(ProductModel product) {
    cartProducts.add(product);
    notifyListeners();
  }

  void removeFromCart(int index) {
    cartProducts.removeAt(index);
    notifyListeners();
  }

  void addCart(int index) {
    _products[index].inCart = !_products[index].inCart;
    notifyListeners();
  }
}
