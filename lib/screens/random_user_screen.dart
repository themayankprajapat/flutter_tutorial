import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/api_service/user_service.dart';
import 'package:flutter_tutorial/providers/user_provider.dart';

class RandomUserScreen extends ConsumerStatefulWidget {
  const RandomUserScreen({super.key});

  @override
  ConsumerState<RandomUserScreen> createState() => _RandomUserScreenState();
}

class _RandomUserScreenState extends ConsumerState<RandomUserScreen> {
  final service = UserService();
  bool isLoading = true;
  // RandomUser? user;

  late String myValue;

  late UserProvider provider;

  @override
  void initState() {
    // getUser();
    provider = ref.read(userProvider);
    provider.getRandomUser().then((user) {
      setState(() {
        isLoading = false;
        myValue = '${user?.name.title} ${user?.name.first} ${user?.name.last}';
      });
    });
    super.initState();
  }

  // Future<void> getUser() async {
  // setState(() {
  //   isLoading = true;
  // });
  // await service.getRandomUserApi().then((value) {
  //   user = value;
  //   isLoading = false;
  //   myValue = '${user!.name.title} ${user!.name.first} ${user!.name.last}';
  //   setState(() {});
  // });
  // }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider).randomUser;

    return Scaffold(
      appBar: AppBar(title: const Text('Random User')),
      floatingActionButton: FloatingActionButton(
        onPressed: provider.getRandomUser,
        child: const Text('NEW'),
      ),
      body: RefreshIndicator(
        color: Colors.deepOrange,
        backgroundColor: Colors.black,
        // displacement: MediaQuery.of(context).size.height / 2,
        edgeOffset: 200,
        onRefresh: provider.getRandomUser,
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
                                user.images.large,
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
                                          '${user.name.title} ${user.name.first} ${user.name.last}';
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
                                          '${user.location.street.name} ${user.location.city} ${user.location.state} ${user.location.country}';
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
                                      myValue = user.phone;
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
