
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: Container(
          alignment: Alignment.center,
          color: Colors.amber,
          height: 100,
          width: 100,
          child: const Text('hey'),
        ),
      ),
    );
  }
}