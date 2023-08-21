import 'dart:developer' as dev;
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/components/app_drawer.dart';
import 'package:flutter_tutorial/components/decoration_image_frame.dart';
import 'package:flutter_tutorial/screens/sign_in_screen.dart';

final appKey = GlobalKey<ScaffoldState>();

class App extends StatelessWidget {
  const App({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: appKey,
        drawer: const AppDrawer(),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            log('Floating');
          },
          child: const Icon(Icons.add),
        ),
        // backgroundColor: Colors.blue,
        appBar: AppBar(
          // toolbarHeight: 100,
          // flexibleSpace: Container(
          //   height: 100,
          //   width: 50,
          //   color: Colors.amber,
          // ),
          // bottom: AppBar(
          //   title: TextField(),
          // ),
          // elevation: 100,
          leading: GestureDetector(
            onTap: () {
              appKey.currentState?.openDrawer();
            },
            child: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                );
              },
              child: const Text(
                "Sign in",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                dev.log('Tapped', name: 'verified');
              },
              icon: const Icon(
                Icons.verified_user_outlined,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                dev.log('Tapped', name: 'shopping');
              },
              icon: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ),
            )
          ],
          backgroundColor: const Color.fromARGB(255, 35, 47, 62),
          title: const Text(
            "MyAmazon",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
          ),
        ),
        body: Container(
          color: Colors.amber,
          child: const Column(
            // mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DecoRationImageFrame(),
              Row(),
              // Container(
              //   height: 30,
              //   color: Colors.green,
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(name),
              //       const Text('Hellofghgf'),
              //       const Text('yo'),
              //       const Text('Hey'),
              //       const Text('yup'),
              //     ],
              //   ),
              // ),
              // const Text(
              //   'Hellofghgfrttttttttttttttttttttttttttttttttttttttttttttttttterfdrrrrrrrrrrrrrg',
              //   maxLines: 1,
              //   style: TextStyle(overflow: TextOverflow.ellipsis),
              // ),
              // const Text('yo'),
              // const Text('Hey'),
              // const Text('yup'),
              SizedBox(height: 10),
              MyCustomWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomWidget extends StatelessWidget {
  const MyCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.skewX(10),
      // height: 100,
      // width: 150,
      constraints: const BoxConstraints(
        minHeight: 80,
        maxHeight: 100,
        minWidth: 100,
        maxWidth: 150,
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(width: 3),
        // borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 20,
            spreadRadius: 10,
            offset: Offset(10, 10),
            blurStyle: BlurStyle.normal,
          )
        ],
        // shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.green, Colors.orange],
        ),
      ),
      padding: const EdgeInsets.only(left: 10),
      margin: const EdgeInsets.only(top: 10),
      child: const Text(
        'hello how are you',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
