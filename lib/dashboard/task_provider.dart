import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_app/dashboard/dashboard_screen.dart';
import 'task_model.dart';

final taskListProvider = FutureProvider<List<Task>>((ref) async {
  final supabase = ref.read(supabaseProvider);
  return await supabase.getTasks();
});
