import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/todo_models.dart';
import 'package:http/http.dart' as http;

class TodoProvider extends ChangeNotifier {
  TodoProvider() {
    this.fetchTasks();
  }
  List<Todo> _todos = [];

  List<Todo> get todos {
    return [..._todos];
  }

  void addTodo(Todo todo) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/apis/v1/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(todo),
    );

    if (response.statusCode == 201) {
      todo.id = json.decode(response.body)['id'];
      _todos.add(todo);
      notifyListeners();
    }
  }

  fetchTasks() async {
    final url = 'http://127.0.0.1:8000/apis/v1/?format=json';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _todos = data.map<Todo>((json) => Todo.fromJson(json)).toList();
      notifyListeners();
    }
  }
}
