import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:notifier_app/components/tasks_components/task_details_button.dart';
import 'package:notifier_app/components/text_bold_grey.dart';
import 'package:notifier_app/components/text_grey.dart';
import 'package:notifier_app/components/traffic_indicator.dart';

class TaskDetails extends StatefulWidget {

  String taskTitle;
  String taskGroup;
  String taskBeginDate;
  String taskDueDate;
  String taskAssignedTo;
  String taskAssignedBy;
  //VoidCallback callback;

  TaskDetails({
    super.key,
    required this.taskTitle,
    required this.taskGroup,
    required this.taskBeginDate,
    required this.taskDueDate,
    required this.taskAssignedTo,
    required this.taskAssignedBy,
    //required this.callback
  });

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  String currentStatus = 'Open';
  int? _sliding = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Navigator.pushNamed(context, '/TaskDetailspage'),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            width: 400,
            decoration: BoxDecoration(
                color: const Color(0xFFE9E9E9),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    TextBoldGrey(boldText: 'Renew Fire Extinguisher'),
                    const SizedBox(
                      width: 10,
                    ),
                    TrafficIndicator(
                        indicatorColor: Colors.red
                    )
                  ],
                ),
                TextGrey(textDetails: 'task Group: ${widget.taskGroup}'),
                TextGrey(textDetails: 'Begin Date: ${widget.taskBeginDate}'),
                TextGrey(textDetails: 'Due Date: ${widget.taskDueDate}'),
                TextGrey(textDetails: 'Assigned To: ${widget.taskAssignedTo}'),
                TextGrey(textDetails: 'Assigned By: ${widget.taskAssignedBy}'),

                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Task Progress:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF616260),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        EasyPieChart(
                          children: [
                            PieData(value: 30, color: const Color(0xFF7FA2D4)),
                            PieData(value: 70, color: const Color(0xFF2B5EA8)),
                          ],
                          pieType: PieType.fill,
                          size: 150,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,// Status
                      children: [
                        const Text(
                          'Status:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF616260),
                          ),
                        ),
                        DropdownButton<String>(
                            value: currentStatus,
                            items: const [
                              DropdownMenuItem(
                                value: 'Open',
                                child: Text('Open'),
                              ),
                              DropdownMenuItem(
                                value: 'Acknowledge',
                                child: Text('Acknowledge'),
                              ),
                              DropdownMenuItem(
                                value: 'Closed',
                                child: Text('Closed'),
                              ),
                            ],
                            onChanged:  (String? newValue) {
                              setState(() {
                                currentStatus = newValue!;
                              });
                            }
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    CupertinoSlidingSegmentedControl(
                      children: const {
                        0: Text('User list'),
                        1: Text('Playback'),
                      },
                      groupValue: _sliding,
                      onValueChanged: (int? newValue) {
                        setState(() {
                          _sliding = newValue;
                        });
                      },
                      backgroundColor: const Color(0xFFD9D9D9),
                      thumbColor: const Color(0xFFADA1F8),
                    ),
                    TaskDetailsButton(icon: 'assets/icons/chatting-icon.png', callback: () => Navigator.pushNamed(context, '/chatpage')),
                    TaskDetailsButton(icon: 'assets/icons/checklist-icon.png', callback: () => Navigator.pushNamed(context, '/taskchecklistpage')),
                  ],
                ),
                const SizedBox(height: 20),
                Table(
                  border: TableBorder.all(
                      color: Colors.black
                  ),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: const [
                    TableRow(
                        decoration: BoxDecoration(
                            color: Color(0xFFECF0FB)
                        ),
                        children: [
                          TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Detail 1'),
                              )
                          ),
                          TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Detail 2'),
                              )
                          ),
                          TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Detail 3'),
                              )
                          )
                        ]
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
