import 'package:flutter/material.dart';

class PaintScreen extends StatelessWidget {
  const PaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Custom Paint')),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.white,
          child: CustomPaint(painter: MyPainter()),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Line
    // canvas.drawLine(
    //   Offset(size.width * 0.1, size.height / 2),
    //   Offset(size.width * 0.9, size.height * .6),
    //   paint,
    // );

    // Rectangle
    // final rect = Rect.fromPoints(
    //   Offset(size.width * 0.1, size.height * 0.1),
    //   Offset(size.width * 0.9, size.height * 0.9),
    // );
    // canvas.drawRect(rect, paint);

    // Circle
    // final center1 = Offset(size.width * .4, size.height * .4);
    // final center2 = Offset(size.width * .6, size.height * .4);
    // final center3 = Offset(size.width * .5, size.height * .6);
    // canvas.drawCircle(center1, size.width * .2, paint);
    // canvas.drawCircle(center2, size.width * .2, paint);
    // canvas.drawCircle(center3, size.width * .2, paint);

    // Arc
    // canvas.drawArc(rect, pi / 4, pi / 2, true, paint);

    // Path
    final path = Path();
    path.moveTo(size.width * .1, size.width * .2);
    path.arcToPoint(
      Offset(size.width * .9, size.width * .2),
      radius: const Radius.circular(200),
      clockwise: false,
    );
    // path.lineTo(size.width * .9, size.width * .2);
    // path.lineTo(size.width * .9, size.width * .4);
    // path.lineTo(size.width * .6, size.width * .7);
    // path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MyPainter oldDelegate) => false;
}
