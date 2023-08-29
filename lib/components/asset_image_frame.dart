import 'package:flutter/material.dart';

class AssetImageFrame extends StatelessWidget {
  const AssetImageFrame({super.key, required this.src});
  final String src;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      color: Colors.blue,
      child: Image.asset(src),
    );
  }
}
