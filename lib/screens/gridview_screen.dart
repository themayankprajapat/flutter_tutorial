import 'package:flutter/material.dart';

List<String> myImages = [
  'https://rukminim2.flixcart.com/fk-p-flap/1100/500/image/97f24748652e61ae.png?q=20',
  'https://picsum.photos/id/237/200/300',
  'https://picsum.photos/seed/picsum/200/300',
  'https://picsum.photos/200/300?grayscale',
];
List<Color> myColors = [
  Colors.amber,
  Colors.green,
  Colors.red,
  Colors.blue,
  Colors.black,
  Colors.brown,
  Colors.amber,
  Colors.orange,
  Colors.amber,
  Colors.green,
  Colors.red,
  Colors.blue,
  Colors.black,
  Colors.brown,
  Colors.amber,
  Colors.orange,
];

class GridviewScreen extends StatelessWidget {
  const GridviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gridview")),
      body: GridView.builder(
        // padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          // childAspectRatio: 2 / 3,
          mainAxisExtent: 100,
        ),
        itemCount: myColors.length,
        itemBuilder: (context, index) {
          return Container(color: myColors[index]);
        },
      ),
    );
  }
}
