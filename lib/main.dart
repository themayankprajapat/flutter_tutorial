import 'package:flutter/material.dart';
import 'package:flutter_tutorial/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String name = "Sourabh";

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "my first app",
      theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.deepOrange,
              iconTheme: IconThemeData(color: Colors.white))
          // colorScheme: ColorScheme.fromSeed(
          //   seedColor: const Color.fromARGB(255, 124, 196, 255),
          // ),
          ),
      home: App(name: name),
    );
  }
}
