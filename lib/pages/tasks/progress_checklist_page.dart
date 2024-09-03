import 'package:flutter/material.dart';
import 'package:notifier_app/components/background_container.dart';
import 'package:notifier_app/components/save_button.dart';
import 'package:notifier_app/components/text_grey.dart';
import '../../components/custom_app_bar.dart';
import '../../components/nav_bar.dart';
import 'package:notifier_app/components/header.dart';

import '../../components/text_bold_grey.dart';

class ProgressChecklistPage extends StatefulWidget {

  const ProgressChecklistPage({super.key});

  @override
  State<ProgressChecklistPage> createState() => _ProgressChecklistPageState();
}

class _ProgressChecklistPageState extends State<ProgressChecklistPage> {

  bool _passportCheck = true;
  bool _manualCheck = true;
  String company = 'Select company';
  String supervisor = 'Select supervisor';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
            appBarTitle: 'Checklist'
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ContainerHeader(headerTitle: 'Progress'),
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: const Color(0xFFE9E9E9),
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,//Question 1
                    children: [
                      TextBoldGrey(boldText: '1. Have you checked the passport?'),
                      Row(
                        children: [
                          Switch(
                            value: _passportCheck,
                            onChanged: (bool value) {
                              setState(() {
                                _passportCheck = value;
                              });
                          }),
                          const SizedBox(width: 10),
                          TextGrey(textDetails: 'YES/NO')
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column( //Question 2
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextBoldGrey(boldText: '2. Which company is the item from?'),
                      DropdownButton<String>(
                          value: company,
                          items: const [
                            DropdownMenuItem(
                              value: 'Company A',
                              child: Text('Company A'),
                            ),
                            DropdownMenuItem(
                              value: 'Company B',
                              child: Text('Company B'),
                            ),
                            DropdownMenuItem(
                              value: 'Company C',
                              child: Text('Company C'),
                            ),
                            DropdownMenuItem(
                              value: 'Select company',
                              child: Text('Select company'),
                            ),
                          ],
                          onChanged:  (String? newValue) {
                            setState(() {
                              company = newValue!;
                            });

                          },
                        style: const TextStyle(
                          color: Color(0xFF616260)
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column( //Question 3
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextBoldGrey(boldText: '3. What is the name of the supervisor? '),
                      DropdownButton<String>(
                        value: supervisor,
                        items: const [
                          DropdownMenuItem(
                            value: 'Supervisor A',
                            child: Text('Supervisor A'),
                          ),
                          DropdownMenuItem(
                            value: 'Supervisor B',
                            child: Text('Supervisor B'),
                          ),
                          DropdownMenuItem(
                            value: 'Supervisor C',
                            child: Text('Supervisor C'),
                          ),
                          DropdownMenuItem(
                            value: 'Select supervisor',
                            child: Text('Select supervisor'),
                          ),
                        ],
                        onChanged:  (String? newValue) {
                          setState(() {
                            supervisor = newValue!;
                          });

                        },
                        style: const TextStyle(
                            color: Color(0xFF616260)
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),

                  Column( //Question 4
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextBoldGrey(boldText: '4. Have you read the manual'),
                      Row(
                        children: [
                          Switch(
                              value: _manualCheck,
                              onChanged: (bool value) {
                                setState(() {
                                  _manualCheck = value;
                                });
                              }),
                          const SizedBox(width: 10),
                          TextGrey(textDetails: 'YES/NO')
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SaveButton(
                          buttonIcon: 'assets/icons/upload-icon.png',
                          buttonText: 'Submit')

                    ],
                  )
                ],
              ),
            )
          ],
        )
      ),
      )
    );
  }
}
