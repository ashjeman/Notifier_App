import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/background_container.dart';
import '../components/custom_app_bar.dart';
import '../components/header.dart';
import '../components/nav_bar.dart';
import '../components/search_field.dart';
import '../components/task_check_component.dart';

class AssetLocationsPage extends StatefulWidget {
  const AssetLocationsPage({super.key});

  @override
  State<AssetLocationsPage> createState() => _AssetLocationsPageState();
}

class _AssetLocationsPageState extends State<AssetLocationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ContainerHeader(headerTitle: 'Tasks'),
                      Icon(
                        Icons.tune,
                        size: 28,
                      ),
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
                  const Column(
                    children: [
                      TaskCheckComponent(
                        taskTitle: 'Meet with client',
                        taskCategory: 'CCTV',
                        taskDate: '30/4/2024',
                      )
                    ],
                  )
                ],
              )
          ),
        )
    );
  }

  int? _sliding = 0;
}
