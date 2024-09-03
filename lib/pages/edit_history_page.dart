import 'package:flutter/material.dart';
import 'package:notifier_app/components/assets_components/edit_history_component.dart';

import '../components/background_container.dart';
import '../components/custom_app_bar.dart';
import '../components/nav_bar.dart';
import '../components/search_field.dart';

class EditHistoryPage extends StatelessWidget {
  const EditHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(
              appBarTitle: 'Edit History'
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
              SearchField(),
              SizedBox(height: 10),
              Column(
                children: [
                  EditHistoryComponent()
                ],
              )
            ],
          )
        ),
      )
    );
  }
}
