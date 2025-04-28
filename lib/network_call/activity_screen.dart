import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'activity.dart';
import 'provider.dart';

/// The homepage of our application
class ActivityScreen extends ConsumerWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Activity> activity = ref.watch(activityProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Network call")),
      body: Center(
        child: switch (activity) {
          AsyncData(:final value) => Text('Activity: ${value.activity}'),
          AsyncError() => const Text('Oops, something unexpected happened'),
          _ => const CircularProgressIndicator(),
        },
      ),
    );
  }
}
