import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_app/dashboard/dashboard_screen.dart';
import '../dashboard/task_tile.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksAsync = ref.watch(tasksProvider);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: tasksAsync.when(
        data: (tasks) => ListView(children: tasks.map((t) => TaskTile(task: t)).toList()),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
