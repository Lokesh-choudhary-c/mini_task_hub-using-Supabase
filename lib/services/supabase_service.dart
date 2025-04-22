import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../dashboard/task_model.dart';

class SupabaseService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<Task>> getTasks() async {
    final user = _client.auth.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }

    final response = await _client
        .from('tasks')
        .select()
        .eq('user_id', user.id)
        .order('id', ascending: false);

    final data = response as List;

    return data.map((json) => Task.fromJson(json)).toList();
  }

  Future<void> addTask(String title) async {
    final user = _client.auth.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }

    await _client.from('tasks').insert({
      'title': title,
      'is_completed': false,
      'user_id': user.id,
    });
  }

  Future<void> deleteTask(int id) async {
    await _client.from('tasks').delete().eq('id', id);
  }

  Future<void> toggleTaskStatus(int id, bool isCompleted) async {
    await _client
        .from('tasks')
        .update({'is_completed': isCompleted}).eq('id', id);
  }
}

final supabaseProvider = Provider<SupabaseService>((ref) {
  return SupabaseService();
});







