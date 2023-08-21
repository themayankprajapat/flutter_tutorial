import 'package:flutter/material.dart';
import 'package:flutter_tutorial/utils/images.dart';

class DecoRationImageFrame extends StatelessWidget {
  const DecoRationImageFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.login),
          ),
        ),
        child: const Text(
          'yup',
          style: TextStyle(fontSize: 40),
        ));
  }
}
