import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/network_call/activity_screen.dart';
import 'package:flutter_riverpod_tutorial/performing_side_effect/todo_list_screen.dart';
import 'package:flutter_riverpod_tutorial/simple_counter/simple_counter.dart';

void main() {
  runApp(ProviderScope(child: MaterialApp(home: HomeView())));
}

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Riverpod Tutorial')),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          _createPage(context, 'Simple counter', SimpleCounterScreen()),
          _createPage(context, 'Network call', ActivityScreen()),
          _createPage(context, 'Performing side effect', TodoListScreen()),
        ],
      ),
    );
  }

  Widget _createPage(BuildContext context, String name, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          height: 50,
          color: Colors.blue,
          width: double.infinity,
          child: Center(
            child: Text(name, style: const TextStyle(fontSize: 16)),
          ),
        ),
      ),
    );
  }
}
