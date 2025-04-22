import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task_manager_app/dashboard/dashboard_screen.dart';
import 'package:task_manager_app/screens/chat_page.dart';

import 'app/theme.dart';
import 'auth/login_screen.dart';
import 'auth/signup_screen.dart';
import 'screens/messages_page.dart';
final themeModeProvider = StateProvider<ThemeMode>((_) => ThemeMode.system);
final authStateProvider = StreamProvider<User?>((ref) {
  return Supabase.instance.client.auth.onAuthStateChange
      .map((event) => event.session?.user);
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://jvznulsivjfsodlpyjly.supabase.co',
    anonKey:'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp2em51bHNpdmpmc29kbHB5amx5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDUyNDM5NDYsImV4cCI6MjA2MDgxOTk0Nn0.M7AEMkzyEY4B-DSeTzH1FTByJTIypiqHiOvAnxzIEds',
  );

  runApp(const ProviderScope(child: TaskApp()));
}

class TaskApp extends ConsumerWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final authStateAsync = ref.watch(authStateProvider);

    return MaterialApp(
      title: 'DayTask',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,                   
      darkTheme: AppTheme.dark,               
      themeMode: themeMode,                    
      home: authStateAsync.when(
        data: (user) {
          if (user != null) {
            return const DashboardScreen();
          } else {
            return const LoginScreen();
          }
        },
        loading: () => const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
        error: (_, __) => const Scaffold(
          body: Center(child: Text('Something went wrong')),
        ),
      ),
      routes: {
        '/login': (_) => const LoginScreen(),
        '/signup': (_) => const SignupScreen(),
        '/dashboard': (_) => const DashboardScreen(),
        '/chat': (_) => const ChatPage(),
        '/messages': (_) => const MessagesPage(),
      },
    );
  }
}





