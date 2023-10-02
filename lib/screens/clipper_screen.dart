import 'package:flutter/material.dart';

class ClipperScreen extends StatelessWidget {
  const ClipperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Paint')),
      body: Center(
        child: ClipPath(
          clipper: MyClipper(),
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    // path.arcToPoint(
    //   Offset(size.width * .12, size.height * .97),
    //   radius: Radius.circular(400),
    //   clockwise: false,
    // );
    path.lineTo(size.width / 2, size.height * .75);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
