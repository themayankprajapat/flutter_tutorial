import 'package:flutter/material.dart';

class NetworkImageFrame extends StatelessWidget {
  const NetworkImageFrame(
    this.src, {
    super.key,
    this.height = 110,
    this.width = 110,
  });
  final String src;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(src),
      height: height,
      fit: BoxFit.cover,
      width: width,
      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
      loadingBuilder: (context, child, progress) =>
          progress == null ? child : const CircularProgressIndicator(),
    );
  }
}
