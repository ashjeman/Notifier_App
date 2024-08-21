import 'package:flutter/material.dart';
import 'package:notifier_app/pages/alarm_list_page.dart';
import 'package:notifier_app/pages/asset_items_page.dart';
import 'package:notifier_app/pages/asset_locations_page.dart';
import 'package:notifier_app/pages/dashboard_page.dart';
import 'package:notifier_app/pages/edit_asset_page.dart';
import 'package:notifier_app/pages/edit_history_page.dart';
import 'package:notifier_app/pages/home_page.dart';
import 'package:notifier_app/pages/login_page.dart';
import 'package:notifier_app/pages/alarm_page.dart';
import 'package:notifier_app/pages/progress_checklist_page.dart';
import 'package:notifier_app/pages/task_check_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
        '/alarmpage': (context) => AlarmPage(),
        '/alarmlistpage': (context) => const AlarmListPage(),
        '/progresschecklistpage': (context) => const ProgressChecklistPage(),
        '/dashboardpage': (context) => const DashboardPage(),
        '/taskchecklistpage': (context) => const TaskCheckListPage(),
        '/assetlocationspage': (context) => const AssetLocationsPage(),
        '/assetitemspage': (context) => const AssetItemsPage(),
        '/edithistorypage': (context) => const EditHistoryPage(),
        '/editassetpage': (context) => const EditAssetPage()
      },
    );
  }
}