import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/validators.dart';
import 'dashboard_screen.dart';

class AddTaskBottomSheet extends ConsumerWidget {
  const AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    final ctrl = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Text('New Task', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          TextFormField(
            controller: ctrl,
            decoration: const InputDecoration(labelText: 'Task Title'),
            validator: Validators.validateTaskTitle,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFC107)),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                await ref.read(supabaseProvider).addTask(ctrl.text.trim());
                Navigator.pop(context);
                final _ = ref.refresh(tasksProvider);
              }
            },
            child: const Text('Add', style: TextStyle(color: Colors.black87)),
          ),
        ]),
      ),
    );
  }
}








