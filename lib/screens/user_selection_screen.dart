import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/user_model.dart';
import 'package:flutter_tutorial/utils/database.dart';

class UserSelectionScreen extends StatefulWidget {
  const UserSelectionScreen({super.key});

  @override
  State<UserSelectionScreen> createState() => _UserSelectionScreenState();
}

class _UserSelectionScreenState extends State<UserSelectionScreen> {
  List<UserModel> selectedUsers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Selection'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  selectedUsers.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(selectedUsers[index].avatar),
                              radius: 35,
                            ),
                            Text(selectedUsers[index].name),
                          ],
                        ),
                        Positioned(
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              selectedUsers.removeAt(index);
                              setState(() {});
                            },
                            child: const Icon(Icons.cancel),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  selected: selectedUsers.contains(users[index]),
                  selectedColor: Colors.grey,
                  onTap: () {
                    if (selectedUsers.contains(users[index])) {
                      selectedUsers.remove(users[index]);
                    } else {
                      selectedUsers.add(users[index]);
                    }
                    setState(() {});
                  },
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(users[index].avatar),
                      ),
                      if (selectedUsers.contains(users[index]))
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.done,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                  title: Text(users[index].name),
                  subtitle: Text(users[index].messages.last.text),
                  trailing:
                      Text('${users[index].messages.last.time.minute} min'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
