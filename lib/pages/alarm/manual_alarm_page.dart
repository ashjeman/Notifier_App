import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notifier_app/components/background_container.dart';
import 'package:notifier_app/components/alarm_components/manual_alarm_field.dart';
import 'package:notifier_app/components/save_button.dart';
import 'package:notifier_app/models/allAlarmGroup.dart';
import 'package:notifier_app/services/alarm_service.dart';
import 'package:notifier_app/services/asset_location_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:notifier_app/services/manual_alarm_service.dart';

import '../../components/custom_app_bar.dart';
import '../../models/AllAlarm.dart';
import '../../models/allSite.dart';
import '../../controller.dart';

class ManualAlarmPage extends StatefulWidget {
  const ManualAlarmPage({super.key});

  @override
  State<ManualAlarmPage> createState() => _ManualAlarmPageState();
}

class _ManualAlarmPageState extends State<ManualAlarmPage> {
  late Controller controller;

  //initiates variable
  DateTime alarmDate = DateTime.now();
  TimeOfDay alarmTime = TimeOfDay.now();
  String? selectedGroupName;
  EscalationState? selectedEscalationState;
  int selectedSiteId = 0;
  List<AllSite>? allSites;
  int selectedAlarmGroupId = 0;
  List<AllAlarmGroup>? allAlarmGroup;
  bool mediaSelected = false;
  TextEditingController descriptionController = TextEditingController();
  String filePath = '';

  //initiates Getx controller and get dropdown data
  @override
  void initState() {
    super.initState();
    controller = Get.put(Controller());
    selectedEscalationState = EscalationState.PENDING;
    selectedSiteId = controller.siteId.value;
    selectedAlarmGroupId = 1001;
    getData().then((_) {
      setState(() {}); // Trigger UI update after data is fetched
    });
  }

  //get sites and alarm group list for dropdowns
  getData() async {
    allSites = await AssetLocationService().getAllSite();
    allAlarmGroup = await AlarmService().getAlarmGroup();
  }

  String getEscalationState(EscalationState escalationState){
    return escalationState.toString().split('.').last;
  }

  Future<void> openDirectoryPicker() async {

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        filePath = file.path!;
        mediaSelected = true;
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: CustomAppBar(
          appBarTitle: 'Manual Alarm'
        )
      ),
      //bottomNavigationBar: NavBar(currentPageIndex: 2),
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
                            mediaSelected ?
                            SizedBox(
                              height: 200,
                              child: Image.file(File(filePath), width: double.infinity, fit: BoxFit.cover),
                            )
                            : Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFB2BED0),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: const Text("No media selected"),
                            ),
                            Positioned(
                                right: 10,
                                bottom: 10,
                                child: GestureDetector(
                                  onTap: () async {
                                    openDirectoryPicker();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFC9D7EB),
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    height: 40,
                                    width: 40,
                                    child: const Icon(Icons.add),),
                                )
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    PopupMenuLabel(fieldIconPath: 'assets/icons/alarm-ring-icon.png', fieldName: 'Date/Time'),
                                    const SizedBox(width: 20),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2000),
                                                lastDate: DateTime(2030)
                                            ).then((selectedDate) {
                                              setState(() {
                                                alarmDate = selectedDate!;
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
                                                Text('${alarmDate.day}/${alarmDate.month}/${alarmDate.year}', style: const TextStyle(fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        GestureDetector(
                                          onTap: () async {
                                            showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now(),
                                              initialEntryMode: TimePickerEntryMode.dial
                                            ).then((selectedTime){
                                              setState(() {
                                                alarmTime = selectedTime!;
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
                                                Text('${alarmTime.hour}:${alarmTime.minute}', style: const TextStyle(fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                            )
                          ],
                        ),
                        Row(
                          children: [
                            PopupMenuLabel(fieldIconPath: 'assets/icons/alarm-ring-icon.png', fieldName: 'Alarm group'),
                            Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    DropdownButton( //taken from asset_location_page.dart
                                        value: selectedAlarmGroupId,
                                        items: allAlarmGroup?.map((e) {
                                          return DropdownMenuItem(
                                            value: e.id,
                                            child: Text(e.alarmGroupName),
                                          );
                                        }).toList(),
                                        onChanged: (v) {
                                          setState(() {
                                            selectedAlarmGroupId = v as int;
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
                            PopupMenuLabel(fieldIconPath: 'assets/icons/alarm-ring-icon.png', fieldName: 'Escalation state'),
                            Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    DropdownButton<EscalationState>(
                                      value: selectedEscalationState,
                                      items: EscalationState.values.map((EscalationState escalationState) {
                                        return DropdownMenuItem<EscalationState>(
                                          value: escalationState,
                                          child: Text(getEscalationState(escalationState)),
                                        );
                                      }).toList(),
                                      onChanged: (EscalationState? value) {
                                        setState(() {
                                          selectedEscalationState = value;
                                        });
                                      },
                                    )],
                                )
                            )
                          ],
                        ),
                        Row(
                          children: [
                            PopupMenuLabel(fieldIconPath: 'assets/icons/alarm-ring-icon.png', fieldName: 'Site'),
                            Flexible(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    DropdownButton( //taken from asset_location_page.dart
                                      value: selectedSiteId,
                                      items: allSites?.map((e) {
                                        return DropdownMenuItem(
                                          value: e.id,
                                          child: Text("${e.siteName}"),
                                        );
                                      }).toList(),
                                      onChanged: (v) {
                                        setState(() {
                                          selectedSiteId = v as int;
                                        });
                                      }
                                    ),
                                  ],
                                )
                            )
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
                              controller: descriptionController,
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                //lib/services/manual_alarm_service.dart
                                ManualAlarmService().createManualAlarm(
                                    controller.userId.value, //userID
                                    descriptionController.text, //message
                                    selectedSiteId, //siteID
                                    selectedAlarmGroupId, //alarmGroupID
                                    EscalationState.PENDING, //escalationState
                                    filePath //filePath
                                );
                                Navigator.pop(context);
                                mediaSelected = false;
                              },
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
