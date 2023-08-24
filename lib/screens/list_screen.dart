import 'package:flutter/material.dart';

List<Map<String, dynamic>> myImages = [
  // 'https://rukminim2.flixcart.com/fk-p-flap/1100/500/image/97f24748652e61ae.png?q=20',
  // 'https://picsum.photos/id/237/200/300',
  // 'https://picsum.photos/seed/picsum/200/300',
  // 'https://picsum.photos/200/300?grayscale',

  {'name': 'Mayank', 'age': 22},
  {'name': 'Shreyansh', 'age': 23},
  {'name': 'Saorabh', 'age': 22},
  {'name': 'Ajay', 'age': 22},
  {'name': 'Ajay', 'age': 22},
  {'name': 'Ajay', 'age': 22},
  {'name': 'Ajay', 'age': 22},
  {'name': 'Ajay', 'age': 22},
  {'name': 'Ajay', 'age': 22},
  {'name': 'Ajay', 'age': 22},
  {'name': 'Ajay', 'age': 22},
  {'name': 'Ajay', 'age': 22},
  {'name': 'Ajay', 'age': 22},
  {'name': 'Ajay', 'age': 22},
  {'name': 'Ajay', 'age': 22},
  {'name': 'Ajay', 'age': 22},
  {'name': 'Ajay', 'age': 22},
  {'name': 'Ajay', 'age': 22},
];

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lists")),
      body: SingleChildScrollView(
        // physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: List.generate(
            myImages.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(myImages[index]['name']),
                  Text(myImages[index]['age'].toString()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
