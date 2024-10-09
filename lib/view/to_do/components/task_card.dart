import 'package:flutter/material.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/utils/styles.dart';
import 'package:simple_ehr/view/to_do/components/priority_tag.dart';

class TaskCard extends StatelessWidget {
  final String date;
  final String time;
  final String title;
  final String priority;

  TaskCard({required this.date, required this.time, required this.title, required this.priority});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {

              },
            ),
            SizedBox(width: 8,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$date, $time",
                    style: interRegular.copyWith(fontSize: 12, color: lightGreyColor),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: interRegular.copyWith(fontSize: 16, color: textColor)
                  ),
                ],
              ),
            ),
            PriorityTag(priority: priority),
          ],
        ),
      ),
    );
  }
}