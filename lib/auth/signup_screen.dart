import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/validators.dart';
import '../auth/auth_service.dart';

final authServiceProvider = Provider((ref) => AuthService());

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    final emailCtrl = TextEditingController();
    final passCtrl = TextEditingController();
    final auth = ref.read(authServiceProvider);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : const Color(0xFFFBE9E7),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: emailCtrl,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: isDarkMode ? Colors.white54 : Colors.black54,
                  ),
                  filled: true,
                  fillColor: isDarkMode ? Colors.grey[800] : Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: Validators.validateEmail,
                style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: passCtrl,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: isDarkMode ? Colors.white54 : Colors.black54,
                  ),
                  filled: true,
                  fillColor: isDarkMode ? Colors.grey[800] : Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
                validator: Validators.validatePassword,
                style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFC107),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await auth.signUp(emailCtrl.text.trim(), passCtrl.text.trim());
                      Navigator.pop(context);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString())),
                      );
                    }
                  }
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 16,
                    color: isDarkMode ? Colors.black87 : Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





