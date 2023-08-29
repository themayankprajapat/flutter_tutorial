import 'package:flutter/material.dart';

class WrapScreen extends StatelessWidget {
  const WrapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wrap Widget')),
      body: const Wrap(
        alignment: WrapAlignment.spaceEvenly,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 30,
        textDirection: TextDirection.rtl,
        verticalDirection: VerticalDirection.up,
        children: [
          Text('yo'),
          Text('Something Written'),
          Text('Something Written'),
          Text('Something Written'),
          Text('Something Written'),
          Text('Wrap Widget'),
          Text('Wrap Widget'),
          Text('This is demo'),
          Text('This is demo'),
          Text('This is demo'),
          Text('Wrap Widget'),
          Text('Wrap Widget'),
        ],
      ),
    );
  }
}
