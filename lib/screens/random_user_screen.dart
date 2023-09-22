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

  late String myValue;

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
      myValue = '${user!.name.title} ${user!.name.first} ${user!.name.last}';
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
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        myValue,
                        style: const TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      Wrap(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                myValue =
                                    '${user!.name.title} ${user!.name.first} ${user!.name.last}';
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'Name',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                myValue =
                                    '${user!.location.street.name} ${user!.location.city} ${user!.location.state} ${user!.location.country}';
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'Location',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                myValue = user!.phone;
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'Contact',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
      ),
      //
    );
  }
}
