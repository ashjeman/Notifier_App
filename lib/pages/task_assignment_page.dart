import 'package:flutter/material.dart';

import '../components/background_container.dart';
import '../components/custom_app_bar.dart';
import '../components/manual_alarm_field.dart';
import '../components/nav_bar.dart';
import '../components/save_button.dart';

class TaskAssignmentPage extends StatefulWidget {
  const TaskAssignmentPage({super.key});

  @override
  State<TaskAssignmentPage> createState() => _TaskAssignmentPageState();
}

class _TaskAssignmentPageState extends State<TaskAssignmentPage> {
  String taskGroup = 'Task 1';
  String severityLevel = 'Level 1';
  String alarmGroup = 'Group 1';
  DateTime taskDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
            appBarTitle: 'Task Assignment'
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
        child: SingleChildScrollView(
          child: BackgroundContainer(
              boxHeight: 800,
              bgChild: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFB2BED0),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            Positioned(
                                right: 10,
                                bottom: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFC9D7EB),
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  height: 40,
                                  width: 40,
                                  child: const Icon(Icons.add),)
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            PopupMenuLabel(fieldIconPath: 'assets/icons/team-icon.png', fieldName: 'Task group'),
                            Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    DropdownButton<String>(
                                        value: 'Task 1',
                                        items: const [
                                          DropdownMenuItem(
                                            value: 'Task 1',
                                            child: Text('Task 1'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'Task 2',
                                            child: Text('Task 2'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'Task 3',
                                            child: Text('Task 3'),
                                          ),
                                        ],
                                        onChanged:  (String? newValue) {
                                          setState(() {
                                            taskGroup = newValue!;
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
                            PopupMenuLabel(fieldIconPath: 'assets/icons/severity-icon.png', fieldName: 'Severity level'),
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
                                        ],
                                        onChanged:  (String? newValue) {
                                          setState(() {
                                            taskGroup = newValue!;
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
                            PopupMenuLabel(fieldIconPath: 'assets/icons/category-icon.png', fieldName: 'Category'),
                            Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    DropdownButton<String>(
                                        value: 'Category 1',
                                        items: const [
                                          DropdownMenuItem(
                                            value: 'Category 1',
                                            child: Text('Category 1'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'Category 2',
                                            child: Text('Category 2'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'Category 2',
                                            child: Text('Category 2'),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PopupMenuLabel(fieldIconPath: 'assets/icons/schedule-icon.png', fieldName: 'Begin date'),
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
                                    Text('${taskDate.day}/${taskDate.month}/${taskDate.year}', style: const TextStyle(fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PopupMenuLabel(fieldIconPath: 'assets/icons/schedule-icon.png', fieldName: 'Due date'),
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
                                    Text('${taskDate.day}/${taskDate.month}/${taskDate.year}', style: const TextStyle(fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            PopupMenuLabel(fieldIconPath: 'assets/icons/chatting-icon.png', fieldName: 'Description'),
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
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: SaveButton(buttonIcon: 'assets/icons/upload-icon.png', buttonText: 'Submit'),
                            )
                          ],
                        )


                      ])
              )
          ),
        )
      )
    );
  }
}