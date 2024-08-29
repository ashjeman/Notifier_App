import 'package:flutter/material.dart';
import 'package:notifier_app/pages/add_inspection_dialog.dart';
import 'package:notifier_app/pages/alarm_list_page.dart';
import 'package:notifier_app/pages/asset_inspection_page.dart';
import 'package:notifier_app/pages/asset_items_page.dart';
import 'package:notifier_app/pages/asset_locations_page.dart';
import 'package:notifier_app/pages/asset_option_page.dart';
import 'package:notifier_app/pages/chat_history_page.dart';
import 'package:notifier_app/pages/chat_page.dart';
import 'package:notifier_app/pages/dashboard_page.dart';
import 'package:notifier_app/pages/asset_details_page.dart';
import 'package:notifier_app/pages/edit_history_page.dart';
import 'package:notifier_app/pages/home_page.dart';
import 'package:notifier_app/pages/login_page.dart';
import 'package:notifier_app/pages/task_details_page.dart';
import 'package:notifier_app/pages/manual_alarm_page.dart';
import 'package:notifier_app/pages/progress_checklist_page.dart';
import 'package:notifier_app/pages/task_assignment_page.dart';
import 'package:notifier_app/pages/task_check_list_page.dart';

void main() {
  runApp(const NotifierApp());
}

class NotifierApp extends StatelessWidget {
  const NotifierApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notifier App',
      home: LoginPage(),
      theme: ThemeData(fontFamily: 'Inter'),
      routes: {
        '/homepage': (context) => const HomePage(),
        '/loginpage': (context) => LoginPage(),
        '/taskdetailspage': (context) => TaskDetailsPage(),
        '/alarmlistpage': (context) => const AlarmListPage(),
        '/progresschecklistpage': (context) => const ProgressChecklistPage(),
        '/dashboardpage': (context) => const DashboardPage(),
        '/taskchecklistpage': (context) => const TaskCheckListPage(),
        '/assetlocationspage': (context) => const AssetLocationsPage(),
        '/assetitemspage': (context) => const AssetItemsPage(),
        '/edithistorypage': (context) => const EditHistoryPage(),
        '/assetdetailspage': (context) => AssetDetailsPage(),
        '/assetinspectionpage': (context) => const AssetInspectionPage(),
        '/addinspectiondialog': (context) => const AddInspectionDialog(),
        '/chathistorypage': (context) => const ChatHistoryPage(),
        '/chatpage': (context) => const ChatPage(),
        '/manualalarmpage': (context) => const ManualAlarmPage(),
        '/taskassignmentpage': (context) => const TaskAssignmentPage(),
        '/assetoptionpage': (context) => const AssetOptionPage()
      },
    );
  }
}