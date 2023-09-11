import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/textfield_screen.dart';
import 'package:flutter_tutorial/utils/database.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              // Navigator.pushNamed(
              //   context,
              //   Routes.chat,
              //   arguments: {'user': users[index]},
              // );
              Navigator.push<int>(
                context,
                MaterialPageRoute(
                  builder: (context) => TextFieldScreen(user: users[index]),
                ),
              ).then((value) {
                setState(() {});
                log(value.toString());
              });
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(users[index].avatar),
            ),
            title: Text(users[index].name),
            subtitle: Text(users[index].messages.last.text),
            trailing: Text('${users[index].messages.last.time.minute} min'),
          );
        },
      ),
    );
  }
}
