import 'package:flutter/material.dart';
import 'package:flutter_tutorial/providers/cart_provider.dart';
import 'package:flutter_tutorial/screens/cart_screen.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late CartProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<CartProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Products'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Consumer<CartProvider>(
        builder: (context, products, child) {
          return GridView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: products.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 2 / 5,
            ),
            itemBuilder: (context, index) => Container(
              color: Colors.black12,
              child: Column(
                children: [
                  Image.network(
                    products.products[index].image,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products.products[index].name,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          products.products[index].description,
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Rs. ${products.products[index].price}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                          onPressed: () {
                            if (products.cartProducts
                                .contains(products.products[index])) {
                            } else {
                              provider.addToCart(products.products[index]);
                            }
                          },
                          icon: Icon(
                            products.cartProducts
                                    .contains(products.products[index])
                                ? Icons.done
                                : Icons.shopping_cart,
                          ),
                          label: Text(
                            products.cartProducts
                                    .contains(products.products[index])
                                ? 'Added'
                                : 'Add To cart',
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
