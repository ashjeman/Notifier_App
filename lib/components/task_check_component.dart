import 'package:flutter/material.dart';
import 'package:notifier_app/components/text_bold_grey.dart';
import 'package:notifier_app/components/text_grey.dart';
import 'package:notifier_app/components/traffic_indicator.dart';

class TaskCheckComponent extends StatelessWidget {
  final String taskTitle;
  final String taskCategory;
  final String taskDate;

  const TaskCheckComponent({
    super.key,
    required this.taskTitle,
    required this.taskCategory,
    required this.taskDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: const Color(0xFFE9E9E9),
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextBoldGrey(boldText: taskTitle),
              Row(
                children: [
                  TrafficIndicator(indicatorColor: Colors.red),
                  const SizedBox(width: 5),
                  TextBoldGrey(boldText: 'High'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextGrey(textDetails: taskCategory),
                  TextGrey(textDetails: taskDate)
                ],
              ),
              PopupMenuButton(
                onSelected: selectAction,
                iconColor: const Color(0xFF747474),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'Check List',
                    child: ListTile(
                      title: Text('Check List'),
                      leading: Icon(Icons.checklist),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'User List',
                    child: ListTile(
                      title: Text('User List'),
                      leading: Icon(Icons.groups_2),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
          LinearProgressIndicator(
            backgroundColor: const Color(0xFF8D97A5),
            value: 0.7,
            minHeight: 10,
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFF355992),
          ),
        ],
      ),
    );
  }

  void selectAction(String action){
    if (action == 'Check List') {
      // Navigate to Check List
    } else if (action == 'User List') {
      // Navigate to User List
    }
  }
}
