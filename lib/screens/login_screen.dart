import 'package:flutter/material.dart';
import 'package:flutter_tutorial/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<AuthProvider>(context, listen: false);
  }

  final passController = TextEditingController();
  final emailController = TextEditingController();

  final counter = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value = DateTime.now().second;
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: counter,
              builder: (context, value, child) {
                return Text(
                  value.toString(),
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),

            ValueListenableBuilder(
              valueListenable: emailController,
              builder: (context, value, child) {
                return Text(
                  value.text,
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),

            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              // onChanged: (value) {
              //   setState(() {});
              //   // provider.setEmail = value;
              // },
              decoration: const InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // TextField(
            //   controller: emailController,
            //   onChanged: (value) {
            //     // provider.setPassword = value;
            //   },
            //   decoration: const InputDecoration(
            //     hintText: 'Password',
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            // const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     provider.login(emailController.text, passController.text);
            //   },
            //   child: const Text('Login'),
            // )
          ],
        ),
      ),
    );
  }
}
