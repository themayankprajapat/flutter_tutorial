import 'dart:developer';

import 'package:flutter/material.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Explore ',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                Text(
                  'Plus',
                  style: TextStyle(fontSize: 20, color: Colors.amber),
                ),
                Icon(Icons.add, color: Colors.amber)
              ],
            ),
            RichText(
              text: const TextSpan(
                text: 'This is my ',
                style: TextStyle(fontSize: 20, color: Colors.blue),
                children: [
                  TextSpan(
                    text: 'Rich Text',
                    style: TextStyle(color: Colors.amber),
                  ),
                  WidgetSpan(
                    child: Icon(
                      Icons.add,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                log('Its Custom Button');
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(10),
                child: const Text('My Button'),
              ),
            ),
            ElevatedButton(
              // style: ElevatedButton.styleFrom(
              //   foregroundColor: Colors.black,
              //   backgroundColor: Colors.green,
              //   side: const BorderSide(),
              // ),
              onPressed: () {
                log('Its Elevated Button');
              },
              child: const Text('Elevated Button'),
            ),
            TextButton(
              // style: TextButton.styleFrom(
              //   foregroundColor: Colors.black,
              //   backgroundColor: Colors.green,
              //   side: const BorderSide(),
              // ),
              onPressed: () {
                log('Its Text Button');
              },
              child: const Text('Text Button'),
            ),
            GestureDetector(
              onTap: () {
                log('Its Custom Icon Button');
              },
              child: const Icon(Icons.call),
            ),
            IconButton(
              // style: IconButtton.styleFrom(
              //   foregroundColor: Colors.black,
              //   backgroundColor: Colors.green,
              //   side: const BorderSide(),
              // ),
              onPressed: () {
                log('Its Icon Button');
              },
              icon: const Icon(Icons.mail),
            ),
            GestureDetector(
              onTap: () {
                log('Its Custom Icon Text Button');
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(10),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.chat),
                    SizedBox(width: 10),
                    Text('Chat'),
                  ],
                ),
              ),
            ),
            TextButton.icon(
              // style: TextButton.styleFrom(
              //   foregroundColor: Colors.black,
              //   backgroundColor: Colors.green,
              //   side: const BorderSide(),
              // ),
              onPressed: () {
                log('Its Text Icon Button');
              },
              icon: const Icon(Icons.location_on),
              label: const Text('Text Icon Button'),
            ),
            ElevatedButton.icon(
              // style: TextButton.styleFrom(
              //   foregroundColor: Colors.black,
              //   backgroundColor: Colors.green,
              //   side: const BorderSide(),
              // ),
              onPressed: () {
                log('Its Elevated Icon Button');
              },
              icon: const Icon(Icons.location_on),
              label: const Text('Elevated Icon Button'),
            ),
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            FloatingActionButton.extended(
              onPressed: () {},
              label: const Text('Floating Button'),
            )
          ],
        ),
      ),
    );
  }
}
