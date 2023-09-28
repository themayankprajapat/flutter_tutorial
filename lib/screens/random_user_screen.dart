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

  Future<void> getUser() async {
    // setState(() {
    //   isLoading = true;
    // });
    await service.getRandomUserApi().then((value) {
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
      body: RefreshIndicator(
        color: Colors.deepOrange,
        backgroundColor: Colors.black,
        // displacement: MediaQuery.of(context).size.height / 2,
        edgeOffset: 200,
        onRefresh: () async {
          await getUser();
        },
        child: ListView(
          children: [
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : user == null
                    ? const Center(child: Text('something went wrong'))
                    : Center(
                        child: Column(
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
          ],
        ),
      ),
      //
    );
  }
}
