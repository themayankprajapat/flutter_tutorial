import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/sliver_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Tutorial",
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.deepOrange,
            iconTheme: IconThemeData(color: Colors.amber)),
        // colorScheme: ColorScheme.fromSeed(
        //   seedColor: const Color.fromARGB(255, 124, 196, 255),
        // ),
      ),
      home: const SliverScreen(),
    );
  }
}
