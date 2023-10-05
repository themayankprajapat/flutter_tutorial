import 'package:flutter/material.dart';
import 'package:flutter_tutorial/providers/user_provider.dart';
import 'package:flutter_tutorial/todo_app/db_helper.dart';
import 'package:flutter_tutorial/todo_app/todo_model.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  late UserProvider provider;
  bool isLoading = true;

  @override
  void initState() {
    provider = Provider.of<UserProvider>(context, listen: false);
    provider.getTodos().then((value) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TODOs'), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddTodo(no: provider.todos.length),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Selector<UserProvider, List<TodoModel>>(
              selector: (p0, p1) => p1.todos,
              builder: (context, list, child) {
                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: list.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(list[index].title),
                    subtitle: Text(list[index].body),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AddTodo(
                                no: provider.todos.length,
                                model: list[index],
                              ),
                            );
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            DBHelper.instance
                                .delete(list[index])
                                .then((value) => provider.getTodos());
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class AddTodo extends StatefulWidget {
  const AddTodo({super.key, required this.no, this.model});

  final int no;
  final TodoModel? model;

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.model != null) {
      controller1.text = widget.model!.title;
      controller2.text = widget.model!.body;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${widget.model == null ? 'Create' : 'Edit'} TODO'),
            TextField(
              controller: controller1,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller2,
              decoration: const InputDecoration(
                labelText: 'Body',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (widget.model == null) {
                  DBHelper.instance
                      .createTodo(
                    TodoModel(
                      id: widget.no,
                      title: controller1.text,
                      body: controller2.text,
                    ),
                  )
                      .then((value) {
                    context.read<UserProvider>().getTodos();
                    Navigator.pop(context);
                  });
                  return;
                }
                DBHelper.instance
                    .update(
                  TodoModel(
                    id: widget.model!.id,
                    title: controller1.text,
                    body: controller2.text,
                  ),
                )
                    .then((value) {
                  context.read<UserProvider>().getTodos();
                  Navigator.pop(context);
                });
              },
              child: const Text('ADD'),
            )
          ],
        ),
      ),
    );
  }
}
