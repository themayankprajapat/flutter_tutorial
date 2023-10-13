import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/login_screen.dart';
import 'package:flutter_tutorial/todo_app/fire_todo_screen.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        return snapshot.data == null
            ? const LoginScreen()
            : const FireTodoScreen();
      },
    );
  }
}
