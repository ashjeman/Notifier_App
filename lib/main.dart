import 'package:flutter/material.dart';
import 'package:notifier_app/pages/alarm_list_page.dart';
import 'package:notifier_app/pages/home_page.dart';
import 'package:notifier_app/pages/login_page.dart';
import 'package:notifier_app/pages/alarm_page.dart';

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
      home: AlarmListPage()
    );
  }
}