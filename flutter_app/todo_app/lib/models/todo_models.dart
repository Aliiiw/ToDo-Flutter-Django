class Todo {
  int? id;
  final String? title;
  final String? description;

  Todo({this.id, this.title, this.description});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        id: json['id'], title: json['title'], description: json['description']);
  }

  dynamic todoJson() => {
        'id': id,
        'title': title,
        'description': description,
      };
}
