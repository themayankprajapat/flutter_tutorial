import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/product_model.dart';
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
      body: Selector<CartProvider, List<ProductModel>>(
        selector: (ctx, p1) => p1.getProducts,
        builder: (context, products, child) {
          return GridView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: products.length,
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
                    products[index].image,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products[index].name,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          products[index].description,
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Rs. ${products[index].price}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                          onPressed: () {
                            if (products[index].inCart) {
                            } else {
                              // provider.addToCart(products[index]);
                              provider.addCart(index);
                            }
                            setState(() {});
                          },
                          icon: Icon(
                            products[index].inCart
                                ? Icons.done
                                : Icons.shopping_cart,
                          ),
                          label: Text(
                            products[index].inCart ? 'Added' : 'Add To cart',
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
