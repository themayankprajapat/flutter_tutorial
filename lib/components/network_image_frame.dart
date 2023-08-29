import 'package:flutter/material.dart';

class NetworkImageFrame extends StatelessWidget {
  const NetworkImageFrame(
    this.src, {
    super.key,
    // this.height = 280,
    // this.width = 280,
  });
  final String src;
  // final double height;
  // final double width;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(src),
      fit: BoxFit.cover,
      height: MediaQuery.of(context).size.width - 60,
      width: MediaQuery.of(context).size.width - 60,
      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
      loadingBuilder: (context, child, progress) =>
          progress == null ? child : const CircularProgressIndicator(),
    );
  }
}
