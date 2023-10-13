import 'package:flutter/material.dart';
import 'package:flutter_tutorial/api_service/firebasea_api.dart';
import 'package:flutter_tutorial/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    super.initState();
  }

  final passController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();

  // final titleController = TextEditingController();
  // final bodyController = TextEditingController();

  @override
  void dispose() {
    passController.dispose();
    emailController.dispose();
    nameController.dispose();
    // titleController.dispose();
    // bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SignUp'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Username is required';
                }
                return null;
              },
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Email is required';
                }
                return null;
              },
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Passsword is required';
                }
                return null;
              },
              controller: passController,
              decoration: const InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                FireBaseApi.instance.signUp(
                  emailController.text,
                  passController.text,
                  nameController.text,
                );
              },
              child: const Text('SignUp'),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                  (route) => false,
                );
              },
              child: const Text('Already have an account? Login'),
            )
          ],
        ),
      ),
    );
  }
}
