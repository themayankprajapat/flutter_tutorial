import 'package:flutter/material.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              // clipBehavior: Clip.none,
              children: [
                Container(
                  color: Colors.amber,
                  height: 300,
                  width: 300,
                ),
                Container(
                  color: Colors.green,
                  height: 200,
                  width: 200,
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  right: 10,
                  bottom: 10,
                  child: Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
