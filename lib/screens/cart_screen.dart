import 'package:flutter/material.dart';
import 'package:flutter_tutorial/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<CartProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final cartProducts =
        context.select((CartProvider value) => value.cartProducts);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: cartProducts.isEmpty
          ? const Center(child: Text('Your Cart is emopty'))
          : ListView.builder(
              itemCount: cartProducts.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {},
                  leading: Image.network(
                    cartProducts[index].image,
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.blueAccent,
                      width: 40,
                    ),
                  ),
                  title: Text(cartProducts[index].name),
                  subtitle: Text(cartProducts[index].description),
                  trailing: IconButton(
                    onPressed: () {
                      provider.addCart(index);
                    },
                    icon: const Icon(Icons.delete, color: Colors.red),
                  ),
                );
              },
            ),
    );
  }
}
