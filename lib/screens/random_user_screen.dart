import 'package:flutter/material.dart';
import 'package:flutter_tutorial/api_service/user_service.dart';
import 'package:flutter_tutorial/models/random_user.dart';

class RandomUserScreen extends StatefulWidget {
  const RandomUserScreen({super.key});

  @override
  State<RandomUserScreen> createState() => _RandomUserScreenState();
}

class _RandomUserScreenState extends State<RandomUserScreen> {
  final service = UserService();
  bool isLoading = true;
  RandomUser? user;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  void getUser() {
    setState(() {
      isLoading = true;
    });
    service.getRandomUserApi().then((value) {
      user = value;
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Users')),
      floatingActionButton: FloatingActionButton(
        onPressed: getUser,
        child: const Text('NEW'),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : user == null
                ? const Text('something went wrong')
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(
                          user!.images.large,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${user!.name.title} ${user!.name.first} ${user!.name.last}',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
      ),
      //
    );
  }
}
