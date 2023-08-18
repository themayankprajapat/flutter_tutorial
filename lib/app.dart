import 'dart:developer' as dev;
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/components/app_drawer.dart';
import 'package:flutter_tutorial/screens/sign_in_screen.dart';

final appKey = GlobalKey<ScaffoldState>();

class App extends StatelessWidget {
  const App({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: Text(name),
      ),
    );
  }
}
