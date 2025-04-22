import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final groups = List.generate(10, (i) => 'User ${i + 1}');
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: groups.length,
      itemBuilder: (_, i) => ListTile(
        leading: CircleAvatar(child: Text(groups[i][0])),
        title: Text(groups[i]),
        subtitle: const Text('Last message preview...'),
        onTap: () => Navigator.pushNamed(context, '/chat'),
      ),
    );
  }
}
