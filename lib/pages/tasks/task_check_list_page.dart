import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notifier_app/components/tasks_components/task_component.dart';
import '../../components/background_container.dart';
import '../../components/custom_app_bar.dart';
import '../../components/header.dart';
import '../../components/nav_bar.dart';
import '../../components/search_field.dart';

class TaskCheckListPage extends StatefulWidget {
  const TaskCheckListPage({super.key});

  @override
  State<TaskCheckListPage> createState() => _TaskCheckListPageState();
}

class _TaskCheckListPageState extends State<TaskCheckListPage> {
  int? _sliding = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
            appBarTitle: 'Task Check List'
        )
      ),
      bottomNavigationBar: NavBar(currentPageIndex: 0),
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
                  const ContainerHeader(headerTitle: 'Tasks'),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/taskassignmentpage');
                      },
                    child: const Expanded(child: Icon(
                      Icons.add,
                      size: 28,
                    ),),
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
              Column(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => Navigator.pushNamed(context, '/taskdetailspage'),
                    child: TaskComponent(
                        callback: () => Navigator.pushNamed(context, '/taskdetailspage'),
                        imageIcon: 'assets/icons/task-check-icon.png',
                        activityTitle: 'Renew Fire Extinguisher',
                        activitySite: 'Site 1',
                        currentProgress: 0.3
                    ),
                  ),
                  /*TaskCheckComponent(
                      taskTitle: 'Meet with client',
                      taskCategory: 'CCTV',
                      taskDate: '30/4/2024',
                  )*/
                ],
              )
            ],
          )
        ),
      )
    );
  }
}
