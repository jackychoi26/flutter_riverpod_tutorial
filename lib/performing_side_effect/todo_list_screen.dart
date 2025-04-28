import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/performing_side_effect/todo.dart';
import 'package:flutter_riverpod_tutorial/performing_side_effect/todo_list_provider.dart';

class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Todo>> todos = ref.watch(todoListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo list screen (performing side effect)'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final TextEditingController controller = TextEditingController();
          showDialog(
            context: context,
            builder: (dialogContext) {
              return AlertDialog(
                title: const Text('Add Todo'),
                content: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Enter todo description',
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      final text = controller.text.trim();
                      if (text.isNotEmpty) {
                        ref
                            .read(todoListProvider.notifier)
                            .addTodo(Todo(description: text));
                      }
                      Navigator.of(dialogContext).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: switch (todos) {
        AsyncData(:final value) => ListView.builder(
          itemCount: value.length,
          itemBuilder: (_, i) {
            final todo = value[i];
            return Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              color: Colors.blue,
              child: Center(child: Text(todo.description)),
            );
          },
        ),
        AsyncError() => const Center(child: Text('Oops, something went wrong')),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}
