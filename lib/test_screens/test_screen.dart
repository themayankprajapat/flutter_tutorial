import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/stack_screen.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('data'),
          actions: [
            PopupMenuButton(
              // Callback that sets the selected popup menu item.
              // onSelected: (SampleItem item) {
              //   setState(() {
              //     selectedMenu = item;
              //   });
              // },
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StackScreen(),
                      ),
                    );
                  },
                  child: const Text('Item 1'),
                ),
                const PopupMenuItem(
                  child: Text('Item 2'),
                ),
                const PopupMenuItem(
                  child: Text('Item 3'),
                ),
              ],
            )
          ],
        ),
        body: Yup(
          delegate: TwoDimensionalChildBuilderDelegate(
            builder: (p0, vicinity) => const Text('data'),
          ),
        )
        // TwoDimensionalScrollable(
        //   horizontalDetails: const ScrollableDetails.horizontal(),
        //   verticalDetails: const ScrollableDetails.vertical(),
        //   viewportBuilder: (context, verticalPosition, horizontalPosition) =>
        //       ListView.builder(
        //     itemCount: 50,
        //     itemBuilder: (BuildContext context, int index) {
        //       return Container(
        //         color: Color.fromARGB(255, 237 + index, 47 + index, 5 + index),
        //         height: 80,
        //         width: 80,
        //         child: Center(child: Text('$index')),
        //       );
        //     },
        //   ),
        // ),

        );
  }
}

class Yup extends TwoDimensionalScrollView {
  const Yup({super.key, required super.delegate});

  @override
  Widget buildViewport(context, verticalOffset, horizontalOffset) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 100,
      ),
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return const Text('df');
      },
    );
  }
}
