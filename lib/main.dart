import 'package:flutter/material.dart';
import 'package:notifier_app/pages/alarm/alarm_media.dart';
import 'package:notifier_app/pages/assets/add_inspection_dialog.dart';
import 'package:notifier_app/pages/alarm/alarm_list_page.dart';
import 'package:notifier_app/pages/assets/asset_details_page.dart';
import 'package:notifier_app/pages/assets/asset_inspection_page.dart';
import 'package:notifier_app/pages/assets/asset_items_page.dart';
import 'package:notifier_app/pages/assets/asset_locations_page.dart';
import 'package:notifier_app/pages/assets/asset_option_page.dart';
import 'package:notifier_app/pages/chat/chat_history_page.dart';
import 'package:notifier_app/pages/chat/chat_page.dart';
import 'package:notifier_app/pages/dashboard_page.dart';
import 'package:notifier_app/pages/edit_history_page.dart';
import 'package:notifier_app/pages/home_page.dart';
import 'package:notifier_app/pages/login_page.dart';
import 'package:notifier_app/pages/chat/messages_option_page.dart';
import 'package:notifier_app/pages/assets/scanned_items_page.dart';
import 'package:notifier_app/pages/tasks/task_details_page.dart';
import 'package:notifier_app/pages/alarm/manual_alarm_page.dart';
import 'package:notifier_app/pages/tasks/progress_checklist_page.dart';
import 'package:notifier_app/pages/tasks/task_assignment_page.dart';
import 'package:notifier_app/pages/tasks/task_check_list_page.dart';

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
      home: const LoginPage(),
      theme: ThemeData(fontFamily: 'Inter'),
      routes: {
        '/homepage': (context) => const HomePage(),
        '/loginpage': (context) => const LoginPage(),
        '/taskdetailspage': (context) => TaskDetailsPage(),
        '/alarmlistpage': (context) => const AlarmListPage(),
        '/progresschecklistpage': (context) => const ProgressChecklistPage(),
        '/dashboardpage': (context) => const DashboardPage(),
        '/taskchecklistpage': (context) => const TaskCheckListPage(),
        '/assetlocationpage': (context) => const AssetLocationsPage(),
        '/assetitemspage': (context) => const AssetItemsPage(),
        '/edithistorypage': (context) => const EditHistoryPage(),
        '/assetdetailspage': (context) => const AssetDetailsPage(),
        '/assetinspectionpage': (context) => const AssetInspectionPage(),
        '/addinspectiondialog': (context) => const AddInspectionDialog(),
        '/chathistorypage': (context) => const ChatHistoryPage(),
        '/chatpage': (context) => const ChatPage(),
        '/manualalarmpage': (context) => const ManualAlarmPage(),
        '/taskassignmentpage': (context) => const TaskAssignmentPage(),
        '/assetoptionpage': (context) => const AssetOptionPage(),
        '/scanneditemspage': (context) => const ScannedItemsPage(),
        '/messageoptionpage': (context) => const MessageOptionPage(),
        '/alarmmedia': (context) => const AlarmMedia()
      },
    );
  }
}