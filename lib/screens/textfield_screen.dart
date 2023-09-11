import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/messages.dart';
import 'package:flutter_tutorial/models/user_model.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key, required this.user});

  final UserModel user;

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  final textController = TextEditingController();

  // List<Map<String, dynamic>> chats = [];
  bool check = false;

  bool send = false;

  @override
  void initState() {
    super.initState();
    textController.addListener(() {
      if (textController.text.isNotEmpty) {
        send = true;
      } else {
        send = false;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final user = ModalRoute.of(context)?.settings.arguments as UserModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.name),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, 1211232);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Expanded(child: SizedBox()),
            // Row(
            //   children: [
            //     Checkbox(
            //       value: check,
            //       onChanged: (val) {
            //         setState(() {
            //           check = !check;
            //         });
            //         log(val.toString(), name: 'checkbox value');
            //       },
            //     ),
            //     const Text('CheckBox')
            //   ],
            // ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.user.messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    color: Colors.blueAccent,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          widget.user.messages[index].text,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const Spacer(),
                        Text(
                          widget.user.messages[index].time.minute.toString(),
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
                        sendMessage();
                        // log(value, name: 'onSubmitted');
                      },
                      onTap: () {
                        // log(textController.text);
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  if (send == true)
                    ElevatedButton(
                      onPressed: () {
                        sendMessage();
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const StatefulScreen(),
                        //   ),
                        // );
                        // log(textController.text);
                      },
                      child: const Text('Send'),
                    ),
                  if (send == false)
                    ElevatedButton(
                      onPressed: () {
                        // if (textController.text.isNotEmpty) {
                        //   chats.add({
                        //     "message": textController.text,
                        //     'time': '${DateTime.now().second} sec'
                        //   });
                        //   // log(chats.toString());
                        //   textController.clear();
                        //   setState(() {});
                        // }
                      },
                      child: const Text('Record'),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendMessage() {
    if (textController.text.isNotEmpty) {
      widget.user.messages.add(
        Messages(text: textController.text, time: TimeOfDay.now()),
      );
      // log(chats.toString());
      textController.clear();
      setState(() {});
    }
  }
}
