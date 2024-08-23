import 'package:flutter/material.dart';
import 'package:notifier_app/components/background_container.dart';
import 'package:notifier_app/components/header.dart';
import 'package:notifier_app/components/save_button.dart';
import 'package:notifier_app/components/text_bold_grey.dart';
import 'package:notifier_app/pages/asset_inspection_page.dart';

class AddInspectionDialog extends StatefulWidget {
  const AddInspectionDialog({super.key});

  @override
  State<AddInspectionDialog> createState() => _AddInspectionDialogState();
}

class _AddInspectionDialogState extends State<AddInspectionDialog> {
  DateTime inspectionDate = DateTime.now();
  TimeOfDay inspectionTime = TimeOfDay.now();

  DateTime inspectionDueDate = DateTime.now();
  TimeOfDay inspectionDueTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F0143),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        //padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ContainerHeader(headerTitle: 'Add Inspection'),
                GestureDetector(
                  onTap: () => Navigator.popAndPushNamed(context, '/assetinspectionpage'),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: const Icon(Icons.close),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBoldGrey(boldText: '1. Inspection title'),
                  TextField(
                    style: const TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        //filled: true,
                        //fillColor: const Color(0xFF9DAEC3),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(width: 1)
                        )
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextBoldGrey(boldText: '2. Inspection date'),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2030)
                          ).then((selectedDate) {
                            setState(() {
                              inspectionDate = selectedDate!;
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
                              Text('${inspectionDate.day}/${inspectionDate.month}/${inspectionDate.year}'),
                              const SizedBox(width: 5),
                              const Icon(Icons.calendar_month),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((selectedTime) {
                            if (selectedTime != null) {
                              setState(() {
                                inspectionTime = selectedTime;
                              });
                            }
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
                              Text(
                                  '${inspectionTime.hour}:${inspectionTime.minute}'),
                              SizedBox(width: 5),
                              Icon(Icons.schedule),
                            ],
                          ),
                        ),

                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextBoldGrey(boldText: '3. Inspection due date'),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDatePicker(
                              context: context,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2030)
                          ).then((selectedDate) {
                            setState(() {
                              inspectionDueDate = selectedDate!;
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
                              Text('${inspectionDueDate.day}/${inspectionDueDate.month}/${inspectionDueDate.year}'),
                              const SizedBox(width: 5),
                              const Icon(Icons.calendar_month),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((selectedTime) {
                            if (selectedTime != null) {
                              setState(() {
                                inspectionDueTime = selectedTime;
                              });
                            }
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
                              Text('${inspectionDueTime
                                  .hour}:${inspectionDueTime.minute}'),
                              const SizedBox(width: 5),
                              const Icon(Icons.schedule),
                            ],
                          ),
                        ),

                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextBoldGrey(boldText: '4. Inspected by'),
                  TextField(
                    style: const TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        //filled: true,
                        //fillColor: const Color(0xFF9DAEC3),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(width: 1)
                        )
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextBoldGrey(boldText: '5. Assigned to'),
                  TextField(
                    style: const TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        //filled: true,
                        //fillColor: const Color(0xFF9DAEC3),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(width: 1)
                        )
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextBoldGrey(boldText: '6. Total items'),
                  TextField(
                    style: const TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        //filled: true,
                        //fillColor: const Color(0xFF9DAEC3),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(width: 1)
                        )
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SaveButton(
                        buttonIcon: 'assets/icons/save-icon.png',
                        buttonText: 'Save'
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  void toggleAssetForm(){
    setState(() {
      visible = !visible;
    });
  }
}