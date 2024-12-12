import 'package:flutter/material.dart';

class CriticalAlerts extends StatelessWidget {
  final List<Map<String, String>> alerts = [
    {
      'title': 'Safety Equipment Check',
      'description': 'Routine safety equipment check due in 2 days.',
    },
    {
      'title': 'Maintenance Required',
      'description': 'Conveyor belt B3 requires immediate maintenance.',
    },
    {
      'title': 'Shift Change Reminder',
      'description': 'Night shift starts in 1 hour. Please be on time.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Critical Alerts',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: alerts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.warning, color: Colors.amber),
                  title: Text(alerts[index]['title']!),
                  subtitle: Text(alerts[index]['description']!),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

