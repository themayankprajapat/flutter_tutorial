import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final textController = TextEditingController();

class TextFieldScreen extends StatelessWidget {
  const TextFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextField')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Chat'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: TextField(
                maxLines: null,
                minLines: 1,
                textInputAction: TextInputAction.send,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                    icon: const Icon(Icons.person),
                    // label: Text('User Name'),
                    // labelText: 'User Name',
                    helperText: 'Enter User Name',
                    hintText: 'Enter Name',
                    // errorText: 'User Name is wrong',
                    // error: Row(
                    //   children: [Icon(Icons.info), Text('User Name is wrong')],
                    // ),
                    // isCollapsed: true,
                    // contentPadding: EdgeInsets.all(0),
                    // prefix: Icon(Icons.search),
                    suffix: const Icon(Icons.search),
                    counterText: textController.text.length.toString(),
                    // fillColor: Colors.orange,
                    // filled: true,

                    border: const OutlineInputBorder()
                    // enabled: false,
                    ),
                controller: textController,
                // textAlign: TextAlign.center,
                keyboardType: TextInputType.multiline,
                // obscureText: true,
                // readOnly: true,
                onChanged: (value) {
                  log(value, name: 'onChanged');
                },
                onEditingComplete: () {
                  log(textController.text, name: 'onEditngComplete');
                },
                onSubmitted: (value) {
                  log(value, name: 'onSubmitted');
                },
                onTap: () {
                  // log(textController.text);
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                log(textController.text);
              },
              child: const Text('Send'),
            )
          ],
        ),
      ),
    );
  }
}
