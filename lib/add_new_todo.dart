import 'package:flutter/material.dart';
import 'package:todo_app/todo.dart';

class AddNewTodo extends StatefulWidget {
  const AddNewTodo({super.key});

  @override
  State<AddNewTodo> createState() => _AddNewTodoState();
}

class _AddNewTodoState extends State<AddNewTodo> {
  final GlobalKey<FormState> _FormKeys = GlobalKey<FormState>();
  final TextEditingController _TitleTextControllar = TextEditingController();
  final TextEditingController _DescriptionTextControllar =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ToDo new todo",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _FormKeys,
          child: Column(
            children: [
              TextFormField(
                controller: _TitleTextControllar,
                decoration: const InputDecoration(
                  hintText: "Todo Titel",
                ),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return "Enter Todo Title";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _DescriptionTextControllar,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: "Description",
                ),
                validator: (String? value) {
                  String? v = value ?? " ";
                  if (v.trim().isEmpty) {
                    return "Enter your Description";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_FormKeys.currentState!.validate()) {
                      Todo todo = Todo(_TitleTextControllar.text,
                          _DescriptionTextControllar.text, DateTime.now());
                      Navigator.pop(context, todo);
                    }
                  },
                  child: const Text("Add"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _TitleTextControllar.dispose();
    _DescriptionTextControllar.dispose();
    super.dispose();
  }
}
