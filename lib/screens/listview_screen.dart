import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/list_screen.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lists")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text('My listview'),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              itemCount: myImages.length,
              separatorBuilder: (context, index) =>
                  Container(color: Colors.amber, height: 3),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(myImages[index]['name']),
                      Text(myImages[index]['age'].toString()),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
