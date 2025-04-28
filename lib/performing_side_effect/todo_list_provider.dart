import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'todo.dart';

part 'todo_list_provider.g.dart';

// This is a simple `provider` function
/** 
@riverpod
Future<List<Todo>> todoList(Ref ref) async {
  return [
    Todo(description: 'Learn Flutter', isCompleted: true),
    Todo(description: 'Learn Riverpod'),
  ];
}
*/
///

// Notifiers are the "stateful widget" of providers. They require a slight tweak to the syntax for defining a provider.
// When a @riverpod annotation is placed on a class, that class is called a "Notifier".
// The notifier is a wrapper of the `provider`
@riverpod
class TodoList extends _$TodoList {
  @override
  Future<List<Todo>> build() async {
    return [
      Todo(description: 'Learn Flutter', isCompleted: true),
      Todo(description: 'Learn Riverpod'),
    ];
  }

  Future<void> addTodo(Todo todo) async {
    await Future.delayed(Duration(seconds: 2));
  }
}
