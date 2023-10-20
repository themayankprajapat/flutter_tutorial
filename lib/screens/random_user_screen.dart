import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/api_service/user_service.dart';
import 'package:flutter_tutorial/providers/user_provider.dart';
import 'package:flutter_tutorial/utils/images.dart';

class RandomUserScreen extends ConsumerStatefulWidget {
  const RandomUserScreen({super.key});

  @override
  ConsumerState<RandomUserScreen> createState() => _RandomUserScreenState();
}

class _RandomUserScreenState extends ConsumerState<RandomUserScreen>
    with SingleTickerProviderStateMixin {
  final service = UserService();
  bool isLoading = true;
  // RandomUser? user;

  late String myValue;

  late UserProvider provider;

  late AnimationController controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // getUser();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
    provider = ref.read(userProvider);
    // provider.getRandomUser().then((user) {
    //   setState(() {
    //     isLoading = false;
    //     myValue = '${user?.name.title} ${user?.name.first} ${user?.name.last}';
    //   });
    // });
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
    // final user = ref.watch(userProvider).randomUser;

    return Scaffold(
      appBar: AppBar(title: const Text('Random User')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.stop();
        },
        child: const Text('NEW'),
      ),
      body: RefreshIndicator(
        color: Colors.deepOrange,
        backgroundColor: Colors.black,
        // displacement: MediaQuery.of(context).size.height / 2,
        edgeOffset: 200,
        onRefresh: provider.getRandomUser,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // isLoading
            //     ? const Center(child: CircularProgressIndicator())
            //     :
            // user == null
            //     ? const Center(child: Text('something went wrong'))
            //     :
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScaleTransition(
                    scale: _animation,
                    child: const CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage(Images.login),
                    ),
                  ),

                  // GestureDetector(
                  //   onTap: () {
                  //     // Navigator.push(
                  //     //   context,
                  //     //   MaterialPageRoute(
                  //     //     builder: (context) =>
                  //     //         HeroPage(image: user.images.large),
                  //     //   ),
                  //     // );
                  //   },
                  //   child: Hero(
                  //     tag: 'transition',
                  //     child: AnimatedBuilder(
                  //       animation: controller,
                  //       child: CircleAvatar(
                  //         radius: 100,
                  //         backgroundImage: AssetImage(Images.login),
                  //       ),

                  //       // CircleAvatar(
                  //       //   radius: 100,
                  //       //   backgroundImage: NetworkImage(
                  //       //     user.images.large,
                  //       //   ),
                  //       // ),
                  //       builder: (BuildContext context, Widget? child) {
                  //         return Transform.rotate(
                  //           angle: controller.value * 2 * pi,
                  //           child: child,
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 10),
                  // Text(
                  //   myValue,
                  //   style: const TextStyle(fontSize: 20),
                  //   textAlign: TextAlign.center,
                  // ),
                  // Wrap(
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {
                  //         setState(() {
                  //           myValue =
                  //               '${user.name.title} ${user.name.first} ${user.name.last}';
                  //         });
                  //       },
                  //       child: const Padding(
                  //         padding: EdgeInsets.all(20),
                  //         child: Text(
                  //           'Name',
                  //           style: TextStyle(fontSize: 20),
                  //         ),
                  //       ),
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {
                  //         setState(() {
                  //           myValue =
                  //               '${user.location.street.name} ${user.location.city} ${user.location.state} ${user.location.country}';
                  //         });
                  //       },
                  //       child: const Padding(
                  //         padding: EdgeInsets.all(20),
                  //         child: Text(
                  //           'Location',
                  //           style: TextStyle(fontSize: 20),
                  //         ),
                  //       ),
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {
                  //         setState(() {
                  //           myValue = user.phone;
                  //         });
                  //       },
                  //       child: const Padding(
                  //         padding: EdgeInsets.all(20),
                  //         child: Text(
                  //           'Contact',
                  //           style: TextStyle(fontSize: 20),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // )
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

class HeroPage extends StatelessWidget {
  const HeroPage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Hero(
              tag: 'transition',
              child: Image.network(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
