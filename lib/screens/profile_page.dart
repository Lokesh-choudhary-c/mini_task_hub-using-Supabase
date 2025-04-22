import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../auth/auth_service.dart';
import '../main.dart';

final authServiceProvider = Provider((ref) => AuthService());

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(authServiceProvider);
    final user = Supabase.instance.client.auth.currentUser;
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: Text(
                  user?.email?[0].toUpperCase() ?? '?',
                  style: const TextStyle(fontSize: 32),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                user?.email ?? '',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.light_mode),
                  Switch(
                    value: themeMode == ThemeMode.dark,
                    onChanged: (isDark) {
                      ref.read(themeModeProvider.notifier).state =
                          isDark ? ThemeMode.dark : ThemeMode.light;
                    },
                  ),
                  const Icon(Icons.dark_mode),
                ],
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFC107),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                onPressed: () async {
                  await auth.signOut();
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.black87, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

