import 'package:flutter/material.dart';
import 'package:notifier_app/components/edit_form.dart';
import 'package:notifier_app/components/save_button.dart';

import '../components/alarm_details.dart';
import '../components/background_container.dart';
import '../components/custom_app_bar.dart';
import '../components/nav_bar.dart';

class EditAssetPage extends StatefulWidget {
  const EditAssetPage({super.key});

  @override
  State<EditAssetPage> createState() => _EditAssetPageState();
}

class _EditAssetPageState extends State<EditAssetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(
              appBarTitle: 'Edit Asset'
          )
      ),
      bottomNavigationBar: NavBar(currentPageIndex: 2),
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
                  Image.asset(
                      'assets/images/profile.png',
                      height: 150,
                      width: 150
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        EditForm(formName: 'Asset Name', textFieldHint: 'Enter asset name'),
                        EditForm(formName: 'Location', textFieldHint: 'Enter location'),
                        EditForm(formName: 'Quantity', textFieldHint: 'Enter quantity'),
                        EditForm(formName: 'Manufacturer', textFieldHint: 'Enter manufacturer'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SaveButton(
                                buttonText: 'Save',
                                buttonIcon: 'assets/icons/save-icon.png'
                            )
                          ],
                        )
                      ],
                    )
                  )
                ],
              )
          )
      ),

    );
  }
}
