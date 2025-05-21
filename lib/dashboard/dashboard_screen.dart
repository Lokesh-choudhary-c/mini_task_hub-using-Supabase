import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_app/screens/home_page.dart';
import 'package:task_manager_app/screens/messages_page.dart';
import 'package:task_manager_app/screens/notification_page.dart';
import 'package:task_manager_app/screens/profile_page.dart';
import 'package:task_manager_app/screens/schedule_page.dart';
import '../services/supabase_service.dart';
import '../dashboard/task_model.dart';
import 'add_task_bottomsheet.dart';

final supabaseProvider = Provider((ref) => SupabaseService());

final tasksProvider = FutureProvider<List<Task>>((ref) async {
  return ref.read(supabaseProvider).getTasks();
});

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  int _currentIndex = 0;
  static const _pages = [
    HomePage(),
    MessagesPage(),
    SchedulePage(),
    NotificationPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(child: _pages[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFFFFC107),
        unselectedItemColor: Colors.grey,
        onTap: (i) => setState(() => _currentIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Schedule'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton(
              backgroundColor: const Color(0xFFFFC107),
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (_) => const AddTaskScreen(),
              ),
              child: const Icon(Icons.add, color: Colors.black87),
            )
          : null,
    );
  }
}










