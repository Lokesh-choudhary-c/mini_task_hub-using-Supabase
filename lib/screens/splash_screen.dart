import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBE9E7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', height: 150),
            const SizedBox(height: 24),
            const Text(
              'DayTask',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC107),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
              child: const Text("Get Started", style: TextStyle(fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}
