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

  // @override
  // void initState() {
  //   // service.getRandomUserApi();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Users'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: const Text('NEW'),
      ),
      body: FutureBuilder(
        future: service.getRandomUserApi(),
        builder: (BuildContext context, AsyncSnapshot<RandomUser?> snapshot) {
          return !snapshot.hasData
              ? const Center(child: CircularProgressIndicator())
              : snapshot.hasData && snapshot.data == null
                  ? const Center(child: Text('something went wrong'))
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 100,
                            backgroundImage: NetworkImage(
                              snapshot.data!.images.large,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${snapshot.data!.name.title} ${snapshot.data!.name.first} ${snapshot.data!.name.last}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    );
        },
      ),
      //
    );
  }
}
