import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = List.generate(5, (i) => 'Notification ${i + 1}');
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: notes.length,
      itemBuilder: (_, i) => ListTile(
        leading: const Icon(Icons.notifications_active, color: Color(0xFFFFC107)),
        title: Text(notes[i]),
      ),
    );
  }
}
