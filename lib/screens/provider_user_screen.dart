import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/api_service/user_service.dart';
import 'package:flutter_tutorial/models/api_user.dart';
import 'package:flutter_tutorial/providers/user_provider.dart';

final userFutureProvider = FutureProvider.autoDispose<List<ApiUser>>(
  (ref) => UserService().getUsersApi(),
);

class ProviderUserScreen extends ConsumerStatefulWidget {
  const ProviderUserScreen({super.key});

  @override
  ConsumerState<ProviderUserScreen> createState() => _ProviderUserScreenState();
}

class _ProviderUserScreenState extends ConsumerState<ProviderUserScreen> {
  bool loader = true;
  late UserProvider provider;

  @override
  void initState() {
    super.initState();
    // provider = Provider.of<UserProvider>(context, listen: false);

    // provider.getApiUsers().then((value) {
    //   setState(() {
    //     loader = false;
    //   });
    // });
  }

  // @override
  // void dispose() {
  //   provider.apiUserList.clear();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final usersPro = ref.watch(userFutureProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Provider API Users'),
        ),
        body: usersPro.when(
          data: (users) => ListView.separated(
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
          ),
          error: (error, stackTrace) => Center(child: Text(error.toString())),
          loading: () => const Center(child: CircularProgressIndicator()),
        )

        // body: Selector<UserProvider, List<ApiUser>>(
        //   selector: (p0, p1) => p1.apiUserList,
        //   builder: (context, users, child) {
        //     return loader
        //         ? const Center(child: CircularProgressIndicator())
        //         : !loader && users.isEmpty
        //             ? const Center(child: Text('something went wrong'))
        //             : ListView.separated(
        //                 itemCount: users.length,
        //                 separatorBuilder: (BuildContext context, int index) {
        //                   return const Divider();
        //                 },
        //                 itemBuilder: (BuildContext context, int index) {
        //                   return ListTile(
        //                     title: Text(users[index].name),
        //                     trailing: Text(users[index].company.name),
        //                     subtitle: Text(users[index].phone),
        //                   );
        //                 },
        //               );
        //   },
        // ),
        );
  }
}
