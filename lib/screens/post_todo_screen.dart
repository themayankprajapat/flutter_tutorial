import 'package:flutter/material.dart';
import 'package:flutter_tutorial/providers/auth_provider.dart';
import 'package:flutter_tutorial/providers/user_provider.dart';

class PostTodoScreen extends StatefulWidget {
  const PostTodoScreen({super.key});

  @override
  State<PostTodoScreen> createState() => _PostTodoScreenState();
}

class _PostTodoScreenState extends State<PostTodoScreen> {
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

  final counter = ValueNotifier(0);

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
            // TextField(
            //   controller: emailController,
            //   // onChanged: (value) {
            //   //   setState(() {});
            //   //   // provider.setEmail = value;
            //   // },
            //   decoration: const InputDecoration(
            //     hintText: 'Email',
            //     border: OutlineInputBorder(),
            //   ),
            // ),

            TextField(
              // controller: titleController,
              // onChanged: (value) {
              //   setState(() {});
              //   // provider.setEmail = value;
              // },
              onChanged: (value) {
                userProvider.setTitle = value;
              },
              decoration: const InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              // controller: bodyController,
              // onChanged: (value) {
              //   setState(() {});
              //   // provider.setEmail = value;
              // },
              onChanged: (value) {
                userProvider.setBody = value;
              },
              decoration: const InputDecoration(
                hintText: 'Body',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                userProvider.createPost();
              },
              child: const Text('Create Post'),
            )
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
