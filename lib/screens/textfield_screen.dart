import 'dart:developer';

import 'package:flutter/material.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key});

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  final textController = TextEditingController();

  List<Map<String, dynamic>> chats = [];
  bool check = false;
  
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextField')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Checkbox(
                  value: check,
                  onChanged: (val) {
                    setState(() {
                      check = !check;
                    });
                    log(val.toString(), name: 'checkbox value');
                  },
                ),
                const Text('CheckBox')
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    color: Colors.blueAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          chats[index]['message'],
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          chats[index]['time'],
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // const Text('Chat'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      maxLines: null,
                      minLines: 1,
                      textInputAction: TextInputAction.send,
                      // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                          // icon: const Icon(Icons.person),
                          // label: Text('User Name'),
                          // labelText: 'User Name',
                          // helperText: 'Enter User Name',
                          hintText: 'Enter message',
                          // errorText: 'User Name is wrong',
                          // error: Row(
                          //   children: [Icon(Icons.info), Text('User Name is wrong')],
                          // ),
                          // isCollapsed: true,
                          // contentPadding: EdgeInsets.all(0),
                          // prefix: Icon(Icons.search),
                          // suffix: const Icon(Icons.search),
                          // counterText: textController.text.length.toString(),
                          // fillColor: Colors.orange,
                          // filled: true,

                          border: OutlineInputBorder()
                          // enabled: false,
                          ),
                      controller: textController,
                      // textAlign: TextAlign.center,
                      keyboardType: TextInputType.multiline,
                      // obscureText: true,
                      // readOnly: true,
                      onChanged: (value) {
                        // log(value, name: 'onChanged');
                      },
                      onEditingComplete: () {
                        // log(textController.text, name: 'onEditngComplete');
                      },
                      onSubmitted: (value) {
                        // log(value, name: 'onSubmitted');
                      },
                      onTap: () {
                        // log(textController.text);
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (textController.text.isNotEmpty) {
                        chats.add({
                          "message": textController.text,
                          'time': '${DateTime.now().second} sec'
                        });
                        // log(chats.toString());
                        textController.clear();
                        setState(() {});
                      }
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const StatefulScreen(),
                      //   ),
                      // );
                      // log(textController.text);
                    },
                    child: const Text('Send'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
