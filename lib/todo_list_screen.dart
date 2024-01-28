import 'package:flutter/material.dart';
import 'package:todo_app/add_new_todo.dart';
import 'package:todo_app/todo.dart';

import 'edit_todo_scareen.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> todolist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ToDo App",
        ),
      ),
      body: ListView.separated(
        itemCount:todolist.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todolist[index].title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(todolist[index].Description),
                Text(
                  todolist[index].dateTime.toString(),
                ),
              ],
            ),
            trailing: Wrap(
              children: [
                IconButton(
                  onPressed: () {
                    DeleteConframeDialogBox(context, index);
                  },
                  icon: const Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.red,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                   final Todo? update = await  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  EidTodoScreen(todo:todolist[index],Description:todolist[index]),
                      ),
                    );
                   if(update!= null){
                     todolist[index]=update;
                     setState(() {

                     });
                   }
                  },
                  icon: const Icon(
                    Icons.edit,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey.shade200,
            height: 12,
            endIndent: 16,
            indent: 16,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffD35400),
        onPressed: (){
        _onTepAddNewTodoAp();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void DeleteConframeDialogBox(context, index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Delete Todo"),
          content: const Text("Are you sure you want to delete?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                todolist.removeAt(index);
                setState(() {

                });
              },
              child: const Text(
                "Yes , delete",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        );
      },
    );
  }
 Future<void> _onTepAddNewTodoAp()async {
    final Todo? resul = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddNewTodo(),
      ),
    );
    if(resul!=null){
      todolist.add(resul);
      setState(() {
      });
    }

  }
}
