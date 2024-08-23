import 'package:flutter/material.dart';
import 'package:notifier_app/components/text_grey.dart';

import '../components/background_container.dart';
import '../components/custom_app_bar.dart';
import '../components/nav_bar.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CustomAppBar(
                appBarTitle: 'Asset Location'
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
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            height: 800,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFE9E9E9)
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/profile.png',
                        width: 80,
                        height: 80,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Car parking violation',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextGrey(textDetails: 'Severity level: high')
                        ],
                      ),
                      const Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.people),
                              SizedBox(width: 5),
                              Icon(Icons.checklist)
                            ],
                          )
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: double.infinity,
                          height: 610,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                      suffixIcon: const Icon(Icons.attach_file),
                                      hintText: 'Your thoughts...',
                                      contentPadding: const EdgeInsets.only(left: 10),
                                      //filled: true,
                                      //fillColor: const Color(0xFF9DAEC3),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                          borderSide: const BorderSide(width: 0)
                                      )
                                  ),
                                )
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                width: 50,
                                height: 50,
                                padding: const EdgeInsets.all(13),
                                child: Image.asset('assets/icons/send-icon.png'),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0xFFC9D7EB)
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                )
              ],
            )

          )
          )
    );
  }
}
