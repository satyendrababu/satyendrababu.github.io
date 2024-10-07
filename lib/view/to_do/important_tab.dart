import 'package:flutter/material.dart';

import 'components/task_card.dart';

class ImportantTab extends StatelessWidget {
  final List<Map<String, String>> tasks = [
    {"date": "January 24th, 2021", "time": "04:25 PM", "title": "Fix login & register form design", "priority": "High"},
    {"date": "January 24th, 2021", "time": "04:25 PM", "title": "Fix login & register form design", "priority": "Low"},
    {"date": "January 24th, 2021", "time": "04:25 PM", "title": "Fix login & register form design", "priority": "Important"},
    {"date": "January 24th, 2021", "time": "04:25 PM", "title": "Fix login & register form design", "priority": "High"},
    {"date": "January 24th, 2021", "time": "04:25 PM", "title": "Fix login & register form design", "priority": "Low"},
  ];

  @override
  Widget build(BuildContext context) {

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskCard(
            date: tasks[index]['date']!,
            time: tasks[index]['time']!,
            title: tasks[index]['title']!,
            priority: tasks[index]['priority']!,
          );
        },
      );

  }
}
