import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/api/api.dart';
import 'package:todo_app/screens/add_todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: ListView.builder(
          itemCount: todoProvider.todos.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(todoProvider.todos[index].title.toString()),
              subtitle: Text(todoProvider.todos[index].description.toString()),
            );
          }),
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            size: 32,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => AddToDoScreen()));
          }),
    );
  }
}
