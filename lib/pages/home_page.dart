
import 'package:flutter/material.dart';
import 'package:notifier_app/components/background_container.dart';
import 'package:notifier_app/components/categories.dart';
import 'package:notifier_app/components/header.dart';
import 'package:notifier_app/components/nav_bar.dart';
import 'package:notifier_app/components/task_component.dart';
import 'package:notifier_app/components/top_right_button.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String currentSite = 'Servo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
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
                    children: [
                      TopRightButton(icon: const Icon(Icons.settings), callback: () {
                        _displaySettings(context);
                      }),
                      const SizedBox(width: 10),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Categories(
                        categoryIcon: 'assets/icons/manual-alarm-icon.png',
                        categoryName: 'Manual Alarm',
                        toPage: '/manualalarmpage',

                      ),
                      /*Categories(
                        categoryIcon: 'assets/icons/trending-icon.png',
                        categoryName: 'Trending',
                        toPage: '',
                      ),*/
                      Categories(
                        categoryIcon: 'assets/icons/asset-icon.png',
                        categoryName: 'Asset',
                        toPage: '/assetoptionpage',
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
            Expanded(
                child: BackgroundContainer(
                    boxHeight: 400,
                    bgChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
  
  Future _displaySettings(BuildContext context){
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      builder: (context) => Container(
        padding: const EdgeInsets.all(15),
        height: 180,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ContainerHeader(headerTitle: 'Settings'),
            const SizedBox(height: 10),
            const Text(
              'Select site',
              style: TextStyle(
                color: Color(0xFF070458),
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: currentSite,
              items: const [
                DropdownMenuItem(
                  value: 'Servo',
                  child: Text('Servo'),
                ),
              ],
              onChanged:  (String? newValue) {
                setState(() {
                  currentSite = newValue!;
                });
              }
            ),
          ],
        ),
      ),

      
    );
  }
}
