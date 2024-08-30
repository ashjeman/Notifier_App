import 'package:flutter/material.dart';
import 'package:notifier_app/components/edit_form.dart';
import 'package:notifier_app/components/save_button.dart';

import '../components/background_container.dart';
import '../components/custom_app_bar.dart';
import '../components/nav_bar.dart';

class AssetDetailsPage extends StatefulWidget {
  AssetDetailsPage({super.key});


  @override
  State<AssetDetailsPage> createState() => _AssetDetailsPageState();
}

class _AssetDetailsPageState extends State<AssetDetailsPage> {
  String currentStatus = 'Active';
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
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.only(top: 70),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/app-bg.png'),
                fit: BoxFit.cover, // This makes sure the image covers the entire background
              ),
            ),
            child: BackgroundContainer(
              boxHeight: 900,
              bgChild: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: const Color(0xFFB2BED0),
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFC9D7EB),
                            borderRadius: BorderRadius.circular(30)
                          ),
                          height: 40,
                          width: 40,
                          child: const Icon(Icons.add),)
                      )
                    ],
                  ),
                    Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            EditForm(formName: 'Asset Name', textFieldHint: 'Enter asset name'),
                            EditForm(formName: 'Location', textFieldHint: 'Enter location'),
                            EditForm(formName: 'Quantity', textFieldHint: 'Enter quantity'),
                            EditForm(formName: 'Manufacturer', textFieldHint: 'Enter manufacturer'),
                            EditForm(formName: 'QR Code', textFieldHint: 'Scan QR'),
                            const Text(
                                'Current status',
                                style: const TextStyle(
                                    color: Color(0xFF2B5EA8),
                                    fontWeight: FontWeight.bold)
                            ),
                            DropdownButton<String>(
                                value: currentStatus,
                                items: const [
                                  DropdownMenuItem(
                                    value: 'Active',
                                    child: Text('Active'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Inactive',
                                    child: Text('Inactive'),
                                  ),
                                ],
                                onChanged:  (String? newValue) {
                                  setState(() {
                                    currentStatus = newValue!;
                                  });
                                }
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: SaveButton(
                                      buttonText: 'Save',
                                      buttonIcon: 'assets/icons/save-icon.png'
                                  ),
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
      )

    );
  }
}
