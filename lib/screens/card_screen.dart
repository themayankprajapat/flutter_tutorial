import 'package:flutter/material.dart';
import 'package:flutter_tutorial/components/network_image_frame.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            // barrierColor: Colors.green,
            barrierDismissible: false,
            context: context,
            builder: (context) => const MyAlertDialog(),
          );
        },
        child: const Icon(Icons.call),
      ),
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('Card Screen'),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NetworkImageFrame(
                  'https://rukminim2.flixcart.com/fk-p-flap/1100/500/image/97f24748652e61ae.png?q=20'),
              ListTile(
                // enabled: false,
                selectedTileColor: Colors.orange,
                selectedColor: Colors.black,
                // selected: true,
                style: ListTileStyle.list,
                tileColor: Colors.white,
                leading: Icon(Icons.call),
                title: Text('Mayank'),
                subtitle: Text('5 mins ago'),
                trailing: Text('Missed'),
              ),
              Card(
                margin: EdgeInsets.all(40),
                // elevation: 12,
                // surfaceTintColor: Colors.black,
                child: Column(
                  children: [
                    Row(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Card Screen',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Card Screen',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Card Screen',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Card Screen',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(Icons.call),
      title: const Center(child: Text('My Dialog')),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('This is Alert Dialog'),
          Text('This is Alert Dialog'),
          Text('This is Alert Dialog'),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(onPressed: () {}, child: const Text('Ok')),
      ],
    );
  }
}

class MyDialog extends StatelessWidget {
  const MyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Card Screen',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Card Screen',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Card Screen',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Card Screen',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
