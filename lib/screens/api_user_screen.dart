import 'package:flutter/material.dart';
import 'package:flutter_tutorial/api_service/user_service.dart';
import 'package:flutter_tutorial/models/api_user.dart';

class ApiUserScreen extends StatefulWidget {
  const ApiUserScreen({super.key});

  @override
  State<ApiUserScreen> createState() => _ApiUserScreenState();
}

class _ApiUserScreenState extends State<ApiUserScreen> {
  final service = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Users'),
      ),
      body: FutureBuilder(
        future: service.getUsersApi(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ApiUser>?> snapshot) {
          return !snapshot.hasData
              ? const Center(child: CircularProgressIndicator())
              : snapshot.hasError || snapshot.data == null
                  ? const Center(child: Text('something went wrong'))
                  : ListView.separated(
                      itemCount: snapshot.data!.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(snapshot.data![index].name),
                          trailing: Text(snapshot.data![index].company.name),
                          subtitle: Text(snapshot.data![index].phone),
                        );
                      },
                    );
        },
      ),
    );
  }
}
