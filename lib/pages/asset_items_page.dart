import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notifier_app/components/asset_items_component.dart';

import '../components/background_container.dart';
import '../components/custom_app_bar.dart';
import '../components/header.dart';
import '../components/nav_bar.dart';
import '../components/search_field.dart';
import '../components/task_check_component.dart';

class AssetItemsPage extends StatefulWidget {
  const AssetItemsPage({super.key});

  @override
  State<AssetItemsPage> createState() => _AssetItemsPageState();
}

class _AssetItemsPageState extends State<AssetItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CustomAppBar(
                appBarTitle: 'Asset Items'
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
          child: const BackgroundContainer(
              boxHeight: 800,
              bgChild: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: SearchField()),
                      SizedBox(width: 10),
                      Icon(
                        Icons.add,
                        size: 28,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      AssetItemsComponent()
                    ],
                  )
                ],
              )
          ),
        )
    );
  }
}
