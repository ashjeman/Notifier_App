import 'package:flutter/material.dart';
import 'package:notifier_app/components/background_container.dart';
import 'package:notifier_app/components/dashboard_button.dart';
import 'package:notifier_app/components/header.dart';
import 'package:notifier_app/components/nav_bar.dart';
import '../components/custom_app_bar.dart';
import 'package:easy_pie_chart/easy_pie_chart.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(
              appBarTitle: 'Dashboard'
          )
      ),
      bottomNavigationBar: NavBar(currentPageIndex: 1),
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
                const ContainerHeader(headerTitle: 'Alarms'),
                const SizedBox(height: 40),
                EasyPieChart(
                  children: [
                    PieData(value: 30, color: const Color(0xFF6A31E3)),
                    PieData(value: 30, color: const Color(0xFF373144)),
                    PieData(value: 30, color: const Color(0xFF8172A1))
                  ],
                  borderWidth: 50,
                  centerText: 'Latest Percentage',
                  centerStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF043172)
                  ),
                  size: 250,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DashboardButton(
                        buttonText: 'Latest',
                        buttonColor: const Color(0xFF383068),
                        textColor: Colors.white
                    ),
                    DashboardButton(
                        buttonText: 'Category',
                        buttonColor: const Color(0xFFD9D9D9),
                        textColor: Colors.black
                    ),
                    DashboardButton(
                        buttonText: 'Time',
                        buttonColor: const Color(0xFFD9D9D9),
                        textColor: Colors.black
                    ),
                  ],
                )
              ],

            )
        ),
      )
    );
  }
}
