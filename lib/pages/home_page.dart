import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notifier_app/components/background_container.dart';
import 'package:notifier_app/components/categories.dart';
import 'package:notifier_app/components/header.dart';
import 'package:notifier_app/components/nav_bar.dart';
import 'package:notifier_app/components/recent_activities.dart';
import 'package:notifier_app/components/top_right_button.dart';
import 'package:notifier_app/main.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      bottomNavigationBar: NavBar(currentPageIndex: 0),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/app-bg.png'),
            fit: BoxFit.cover, // This makes sure the image covers the entire background
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Home Page',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22
                          ),
                        ),
                        Text(
                          'Welcome back!',
                          style: TextStyle(
                              color: Color(0xFFF3B413),
                              fontSize: 15
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){},
                        child: TopRightButton(
                            icon: const Icon(
                              Icons.notifications,
                              color: Color(0xFF070458),
                            ),
                            callback: (){}
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TopRightButton(
                          icon: const Icon(
                            Icons.logout,
                            color: Color(0xFF070458),
                          ),
                          callback: () => Navigator.pushNamed(context, '/loginpage')
                      ),
                      const SizedBox(width: 15,)
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 17),
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search here',
                    filled: true,
                    fillColor: const Color(0xFF9DAEC3),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                    )
                ),
              ),
            ),
            BackgroundContainer(
              boxHeight: 200,
              bgChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeader(headerTitle: 'Categories'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Categories(
                        categoryIcon: 'assets/icons/manual-alarm-icon.png',
                        categoryName: 'Manual Alarm',
                        toPage: '',

                      ),
                      Categories(
                        categoryIcon: 'assets/icons/trending-icon.png',
                        categoryName: 'Trending',
                        toPage: '',
                      ),
                      Categories(
                        categoryIcon: 'assets/icons/asset-icon.png',
                        categoryName: 'Asset',
                        toPage: '/assetitemspage',
                      ),
                      Categories(
                        categoryIcon: 'assets/icons/task-check-icon.png',
                        categoryName: 'Task Check List',
                        toPage: '/taskchecklistpage',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            BackgroundContainer(
                boxHeight: 400,
                bgChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ContainerHeader(
                        headerTitle: 'Recent Activity'
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 9),
                      child: Text(
                        'Check your recent updates',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => Navigator.pushNamed(context, '/alarmpage'),
                      child: const RecentActivities(
                        imageIcon: 'assets/icons/task-check-icon.png',
                        activityTitle: 'Renew Fire Extinguisher',
                        activitySite: 'Site 1',
                        currentProgress: 0.3
                      ),
                    )
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
