import 'package:flutter/material.dart';
import 'package:flutter_tutorial/api_service/firebasea_api.dart';
import 'package:flutter_tutorial/providers/auth_provider.dart';
import 'package:flutter_tutorial/providers/user_provider.dart';
import 'package:flutter_tutorial/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthProvider provider;
  late UserProvider userProvider;

  @override
  void initState() {
    super.initState();
    // provider = Provider.of<AuthProvider>(context, listen: false);
    // userProvider = Provider.of<UserProvider>(context, listen: false);
  }

  final passController = TextEditingController();
  final emailController = TextEditingController();

  // final titleController = TextEditingController();
  // final bodyController = TextEditingController();

  @override
  void dispose() {
    passController.dispose();
    emailController.dispose();
    // titleController.dispose();
    // bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login'), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
                controller: emailController,
                onChanged: (value) {
                  setState(() {});
                  // provider.setEmail = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
                controller: passController,
                onChanged: (value) {
                  setState(() {});
                  // provider.setEmail = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  FireBaseApi.instance.signInWithGoogle();
                },
                child: const Text('Login with Google'),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  FireBaseApi.instance
                      .login(emailController.text, passController.text);
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                    (route) => false,
                  );
                },
                child: const Text('Don\'t have an account? sign up'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
