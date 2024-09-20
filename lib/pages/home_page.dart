
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notifier_app/components/background_container.dart';
import 'package:notifier_app/components/categories.dart';
import 'package:notifier_app/components/header.dart';
import 'package:notifier_app/components/nav_bar.dart';
import 'package:notifier_app/components/tasks_components/task_component.dart';
import 'package:notifier_app/components/top_right_button.dart';

import '../controller.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Controller controller;
  String currentSite = 'Servo';

  @override
  void initState() {
    super.initState();
    controller = Get.put(Controller());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.grey.shade50,
      bottomNavigationBar: NavBar(currentPageIndex: 0), //lib/components/nav_bar.dart
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
                    children: [
                      /*TopRightButton(icon: const Icon(Icons.settings), callback: () {
                        _displaySettings(context);
                      }),
                      const SizedBox(width: 10),*/
                      TopRightButton(icon: const Icon(Icons.logout), callback: () => Navigator.of(context).popUntil((route) => route.isFirst)),
                      const SizedBox(width: 10),
                    ],
                  )
                ],
              ),
            ),
            BackgroundContainer(
              boxHeight: 200,
              bgChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeader(headerTitle: 'Categories'),
                  //Development purpose only
                  Row(children: [Text("${controller.userName.value} | ${controller.userId.value} | ${controller.mobileNo.value}")],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      //lib/components/categories.dart
                      Categories(
                        categoryIcon: 'assets/icons/manual-alarm-icon.png',
                        categoryName: 'Manual Alarm',
                        toPage: '/manualalarmpage',
                      ),
                      Categories(
                        categoryIcon: 'assets/icons/asset-icon.png',
                        categoryName: 'Asset',
                        toPage: '/assetoptionpage',
                      ),
                      Categories(
                        categoryIcon: 'assets/icons/task-check-icon.png',
                        categoryName: 'Task List',
                        toPage: '/taskchecklistpage',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: BackgroundContainer(
                    boxHeight: 400,
                    bgChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        //lib/components/header.dart
                        const ContainerHeader(
                            headerTitle: 'Recent Tasks'
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
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.only(top: 0.0),
                            children: [

                              //lib/components/tasks_components/task_component.dart
                              TaskComponent(
                                  callback: () => Navigator.pushNamed(context, '/taskdetailspage'),
                                  imageIcon: 'assets/icons/task-check-icon.png',
                                  activityTitle: 'Renew Fire Extinguisher',
                                  activitySite: 'Site 1',
                                  currentProgress: 0.3
                              ),
                              TaskComponent(
                                  callback: () => Navigator.pushNamed(context, '/taskdetailspage'),
                                  imageIcon: 'assets/icons/task-check-icon.png',
                                  activityTitle: 'Renew Fire Extinguisher',
                                  activitySite: 'Site 1',
                                  currentProgress: 0.3
                              ),
                              TaskComponent(
                                  callback: () => Navigator.pushNamed(context, '/taskdetailspage'),
                                  imageIcon: 'assets/icons/task-check-icon.png',
                                  activityTitle: 'Renew Fire Extinguisher',
                                  activitySite: 'Site 1',
                                  currentProgress: 0.3
                              ),
                              TaskComponent(
                                  callback: () => Navigator.pushNamed(context, '/taskdetailspage'),
                                  imageIcon: 'assets/icons/task-check-icon.png',
                                  activityTitle: 'Renew Fire Extinguisher',
                                  activitySite: 'Site 1',
                                  currentProgress: 0.3
                              ),
                              TaskComponent(
                                  callback: () => Navigator.pushNamed(context, '/taskdetailspage'),
                                  imageIcon: 'assets/icons/task-check-icon.png',
                                  activityTitle: 'Renew Fire Extinguisher',
                                  activitySite: 'Site 1',
                                  currentProgress: 0.3
                              ),
                              TaskComponent(
                                  callback: () => Navigator.pushNamed(context, '/taskdetailspage'),
                                  imageIcon: 'assets/icons/task-check-icon.png',
                                  activityTitle: 'Renew Fire Extinguisher',
                                  activitySite: 'Site 1',
                                  currentProgress: 0.3
                              ),
                            ],
                          )
                        )
                      ],
                    )
                ),
            )
          ],
        ),
      ),
    );
  }
}
