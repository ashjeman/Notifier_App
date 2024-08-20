import 'package:flutter/material.dart';
import 'package:notifier_app/components/alarm_details.dart';
import 'package:notifier_app/components/background_container.dart';
import 'package:notifier_app/components/custom_app_bar.dart';

import '../components/nav_bar.dart';

const List<String> progressType = <String>['Pending', 'Camera', 'Close Alarm', 'Check List'];

class AlarmPage extends StatefulWidget {
  String currentProgress = 'Pending';
  AlarmPage({
    super.key
  });

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          appBarTitle: 'Renew Fire Extinguisher'
        )
      ),
      bottomNavigationBar: const NavBar(currentPageIndex: 2),
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
            bgChild: AlarmDetails(
                alarmTitle: 'Renew Fire Extinguisher',
                alarmGroup: 'CCTV',
                alarmBeginDate: '20/6/2024',
                alarmDueDate: '20/6/2024',
                alarmAssignedTo: 'Edmund',
                alarmAssignedBy: 'Yoasobi')
        )
      ),
      
    );
  }
}
