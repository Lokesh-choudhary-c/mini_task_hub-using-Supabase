import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
        backgroundColor: theme.appBarTheme.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Schedule',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: theme.cardColor, 
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: theme.shadowColor.withOpacity(0.1),
                      offset: const Offset(0, 4),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Text(
                  'Schedule Calendar Placeholder',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.textTheme.bodyLarge?.color,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC107),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              ),
              onPressed: () async {
                final DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );

                if (selectedDate != null) {
                  print("Selected date: ${selectedDate.toLocal()}");
                }
              },
              child: Text(
                'Open Full Calendar',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.textTheme.labelLarge?.color,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Plan your tasks and meetings here.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.textTheme.bodyMedium?.color,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
