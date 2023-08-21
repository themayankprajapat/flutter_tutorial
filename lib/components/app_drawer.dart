import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [Icon(Icons.attractions_outlined), Text('data')],
            ),
          ),
          Container(height: 1, color: Colors.black),
          const Row(children: [Icon(Icons.attractions_outlined), Text('data')]),
          const Row(children: [Icon(Icons.attractions_outlined), Text('data')]),
          const Row(children: [Icon(Icons.attractions_outlined), Text('data')]),
          const Row(children: [Icon(Icons.attractions_outlined), Text('data')]),
          const Row(children: [Icon(Icons.attractions_outlined), Text('data')]),
          Container(
            alignment: Alignment.center,
            color: Colors.amber,
            height: 100,
            width: 100,
            child: const Text('hey'),
          ),
        ],
      ),
    );
  }
}
