import 'package:flutter/material.dart';
import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:notifier_app/components/text_bold_grey.dart';
import 'package:notifier_app/components/text_grey.dart';
import 'package:notifier_app/components/traffic_indicator.dart';

class TaskDetails extends StatefulWidget {

  String alarmTitle;
  String alarmGroup;
  String alarmBeginDate;
  String alarmDueDate;
  String alarmAssignedTo;
  String alarmAssignedBy;

  TaskDetails({
    super.key,
    required this.alarmTitle,
    required this.alarmGroup,
    required this.alarmBeginDate,
    required this.alarmDueDate,
    required this.alarmAssignedTo,
    required this.alarmAssignedBy
  });

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  String currentStatus = 'Open';

  @override
  Widget build(BuildContext context) {
    return Column(
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
              TextGrey(textDetails: 'Alarm Group: ${widget.alarmGroup}'),
              TextGrey(textDetails: 'Begin Date: ${widget.alarmBeginDate}'),
              TextGrey(textDetails: 'Due Date: ${widget.alarmDueDate}'),
              TextGrey(textDetails: 'Assigned To: ${widget.alarmAssignedTo}'),
              TextGrey(textDetails: 'Assigned By: ${widget.alarmAssignedBy}'),

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
              const SizedBox(
                height: 20,
              ),
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
    );
  }
}
