import 'package:flutter/material.dart';
import 'package:notifier_app/components/edit_form.dart';
import 'package:notifier_app/components/save_button.dart';

import '../components/task_details.dart';
import '../components/background_container.dart';
import '../components/custom_app_bar.dart';
import '../components/nav_bar.dart';

class AssetDetailsPage extends StatefulWidget {
  const AssetDetailsPage({super.key});

  @override
  State<AssetDetailsPage> createState() => _AssetDetailsPageState();
}

class _AssetDetailsPageState extends State<AssetDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(
              appBarTitle: 'View Asset'
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
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: const Color(0xFFB2BED0),
                        borderRadius: BorderRadius.circular(10)
                    ),
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
