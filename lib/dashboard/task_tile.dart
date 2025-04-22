import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_app/dashboard/task_provider.dart';
import 'task_model.dart';
import 'dashboard_screen.dart';

class TaskTile extends ConsumerWidget {
  final Task task;
  TaskTile({required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: Key(task.id.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (_) async {
        await ref.read(supabaseProvider).deleteTask(task.id);
        final _ = ref.refresh(taskListProvider);
      },
      background: Container(color: Colors.red, alignment: Alignment.centerRight, padding: EdgeInsets.only(right: 20), child: Icon(Icons.delete, color: Colors.white)),
      child: ListTile(
        title: Text(task.title),
        trailing: Icon(task.isCompleted ? Icons.check_circle : Icons.circle_outlined),
      ),
    );
  }
}
