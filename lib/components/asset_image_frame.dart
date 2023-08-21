import 'package:flutter/material.dart';

class AssetImageFrame extends StatelessWidget {
  const AssetImageFrame({super.key, required this.src});
  final String src;
  @override
  Widget build(BuildContext context) {
    return Image.asset(src, width: 110, height: 110);
  }
}
