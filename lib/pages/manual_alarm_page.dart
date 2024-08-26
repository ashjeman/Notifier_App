import 'package:flutter/material.dart';
import 'package:notifier_app/components/background_container.dart';
import 'package:notifier_app/components/manual_alarm_field.dart';
import 'package:notifier_app/components/save_button.dart';

import '../components/custom_app_bar.dart';
import '../components/nav_bar.dart';

class ManualAlarmPage extends StatefulWidget {
  const ManualAlarmPage({super.key});

  @override
  State<ManualAlarmPage> createState() => _ManualAlarmPageState();
}

class _ManualAlarmPageState extends State<ManualAlarmPage> {
  String alarmGroup = 'Alarm 1';
  DateTime taskDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CustomAppBar(
                appBarTitle: 'Manual Alarm'
            )
        ),
        bottomNavigationBar: NavBar(currentPageIndex: 2),
        body: Container(
          padding: const EdgeInsets.only(top: 70),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/app-bg.png'),
              fit: BoxFit.cover, // This makes sure the image covers the entire background
            ),
          ),
          child: BackgroundContainer(
            boxHeight: 800,
            bgChild: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB2BED0),
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  const SizedBox(height: 20)
,                  Row(
                    children: [
                      Row(
                        children: [
                          const Text(
                              'Today',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              )
                          ),
                          const SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2030)
                              ).then((selectedDate) {
                                setState(() {
                                   taskDate = selectedDate!;
                                });
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Row(
                                children: [
                                  Text('${taskDate.day}/${taskDate.month}/${taskDate.year}', style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                    ),
                    Row(
                      children: [
                        ManualAlarmField(fieldIconPath: 'assets/icons/alarm-ring-icon.png', fieldName: 'Alarm group'),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              DropdownButton<String>(
                                  value: 'Alarm 2',
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'Alarm 1',
                                      child: Text('Alarm 1'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Alarm 2',
                                      child: Text('Alarm 2'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Alarm 3',
                                      child: Text('Alarm 3'),
                                    ),
                                  ],
                                  onChanged:  (String? newValue) {
                                    setState(() {
                                      alarmGroup = newValue!;
                                    });
                                  }
                              )
                            ],
                          )
                        )
                      ],
                    ),
                  Row(
                    children: [
                      ManualAlarmField(fieldIconPath: 'assets/icons/severity-icon.png', fieldName: 'Severity level'),
                      Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              DropdownButton<String>(
                                  value: 'Severity 1',
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'Severity 1',
                                      child: Text('Severity 1'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Severity 2',
                                      child: Text('Severity 2'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Severity 2',
                                      child: Text('Severity 2'),
                                    ),
                                  ],
                                  onChanged:  (String? newValue) {
                                    setState(() {
                                      alarmGroup = newValue!;
                                    });
                                  }
                              )
                            ],
                          )
                      )
                    ],
                  ),
                  Column(
                    children: [
                      ManualAlarmField(fieldIconPath: 'assets/icons/chatting-icon.png', fieldName: 'Description'),
                      TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                            hintText: 'Write a description...',
                            contentPadding: const EdgeInsets.all(5),
                            //filled: true,
                            //fillColor: const Color(0xFF9DAEC3),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(width: 0)
                            )
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SaveButton(buttonIcon: 'assets/icons/upload-icon.png', buttonText: 'Submit')
                    ],
                  )


            ])
          )
        )
    )
    );
  }
}
