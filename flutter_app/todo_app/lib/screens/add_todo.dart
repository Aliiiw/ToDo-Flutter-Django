import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/api/api.dart';
import 'package:todo_app/models/todo_models.dart';

class AddToDoScreen extends StatefulWidget {
  AddToDoScreen({Key? key}) : super(key: key);

  @override
  State<AddToDoScreen> createState() => _AddToDoScreenState();
}

class _AddToDoScreenState extends State<AddToDoScreen> {
  final todoTitleController = TextEditingController();
  final todoDescriptionController = TextEditingController();

  void onAdd() {
    final String titleValue = todoTitleController.text;
    final String descriptionValue = todoDescriptionController.text;

    if (titleValue.isNotEmpty && descriptionValue.isNotEmpty) {
      final Todo todo = Todo(title: titleValue, description: descriptionValue);

      Provider.of<TodoProvider>(context, listen: false).addTodo(todo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adding ToDO'),
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                TextField(
                  controller: todoTitleController,
                ),
                TextField(
                  controller: todoDescriptionController,
                ),
                RaisedButton(
                  onPressed: () {
                    onAdd();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Add'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
