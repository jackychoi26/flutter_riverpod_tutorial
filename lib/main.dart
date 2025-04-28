import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          _createPage(context, 'Simple Counter', SimpleCounterScreen()),
        ],
      ),
    );
  }

  Widget _createPage(BuildContext context, String name, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SimpleCounterScreen()),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: Center(
            child: Text(name, style: const TextStyle(fontSize: 16)),
          ),
        ),
      ),
    );
  }
}
