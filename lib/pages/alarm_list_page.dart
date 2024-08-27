import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:notifier_app/components/alarm_component.dart';
import 'package:notifier_app/components/background_container.dart';
import 'package:notifier_app/components/header.dart';
import 'package:notifier_app/components/search_field.dart';

import '../components/custom_app_bar.dart';
import '../components/nav_bar.dart';

class AlarmListPage extends StatefulWidget {
  const AlarmListPage({super.key});

  @override
  State<AlarmListPage> createState() => _AlarmListPageState();
}

class _AlarmListPageState extends State<AlarmListPage> {
  int? _sliding = 0;
  String alarmSort = 'Date';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(
              appBarTitle: 'Alarm'
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
          bgChild: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ContainerHeader(headerTitle: 'Alarms List'),
                  GestureDetector(
                    onTap: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Sort by'),
                        actions: [
                          ListTile(
                            title: const Text('Name'),
                            leading: Radio<String>(
                              value: 'Name',
                              groupValue: alarmSort,
                              onChanged: (String? value) {
                                setState(() {
                                  alarmSort = value!;
                                });
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('Date'),
                            leading: Radio<String>(
                              value: 'Date',
                              groupValue: alarmSort,
                              onChanged: (String? value) {
                                setState(() {
                                  alarmSort = value!;
                                });
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    child: const ImageIcon(AssetImage('assets/icons/sort-icon.png'), color: Color(0xFF070458)),
                  )
                ],
              ),
              const SizedBox(height: 10),
              const SearchField(),
              const SizedBox(height: 10),
              CupertinoSlidingSegmentedControl(
                children: const {
                  0: Text('Open'),
                  1: Text('Acknowledge'),
                  2: Text('Close')
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
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 0.0),
                  children: const [
                    AlarmComponent(),
                    AlarmComponent(),
                    AlarmComponent(),
                    AlarmComponent(),
                    AlarmComponent(),
                    AlarmComponent(),
                    AlarmComponent(),
                  ],
                )
              )
            ],
          )
      ),
    )
    );
  }
}
