import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/api_user.dart';
import 'package:flutter_tutorial/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ProviderUserScreen extends StatefulWidget {
  const ProviderUserScreen({super.key});

  @override
  State<ProviderUserScreen> createState() => _ProviderUserScreenState();
}

class _ProviderUserScreenState extends State<ProviderUserScreen> {
  bool loader = true;
  late UserProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<UserProvider>(context, listen: false);

    provider.getApiUsers().then((value) {
      setState(() {
        loader = false;
      });
    });
  }

  // @override
  // void dispose() {
  //   provider.apiUserList.clear();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Provider API Users'),
        ),
        body: Selector<UserProvider, List<ApiUser>>(
          selector: (p0, p1) => p1.apiUserList,
          builder: (context, users, child) {
            return loader
                ? const Center(child: CircularProgressIndicator())
                : !loader && users.isEmpty
                    ? const Center(child: Text('something went wrong'))
                    : ListView.separated(
                        itemCount: users.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider();
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(users[index].name),
                            trailing: Text(users[index].company.name),
                            subtitle: Text(users[index].phone),
                          );
                        },
                      );
          },
        ));
  }
}
