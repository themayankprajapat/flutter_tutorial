import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return FilledButton(onPressed: () {}, child: Text(label));
  }
}
