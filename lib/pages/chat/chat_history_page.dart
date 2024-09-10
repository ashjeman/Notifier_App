import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notifier_app/components/chat_history_component.dart';

import '../../components/background_container.dart';
import '../../components/custom_app_bar.dart';
import '../../components/header.dart';
import '../../components/nav_bar.dart';
import '../../components/search_field.dart';

class ChatHistoryPage extends StatefulWidget {
  const ChatHistoryPage({super.key});

  @override
  State<ChatHistoryPage> createState() => _ChatHistoryPageState();
}

class _ChatHistoryPageState extends State<ChatHistoryPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: CustomAppBar(
              appBarTitle: 'Messages'
          )
      ),
      //bottomNavigationBar: NavBar(currentPageIndex: 3),
      body: Container(
          padding: const EdgeInsets.only(top: 70),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/app-bg.png'),
              fit: BoxFit
                  .cover, // This makes sure the image covers the entire background
            ),
          ),
          child: BackgroundContainer(
              boxHeight: 800,
              bgChild: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(child: SearchField(controller: controller, onChanged: (String ) {  },)),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          _displayAddChat(context);
                        },
                        child: const Icon(Icons.add, size: 30,),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  CupertinoSlidingSegmentedControl(
                    children: const {
                      0: Text('All'),
                      1: Text('Unread'),
                      2: Text('Opened')
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
                  Expanded(
                      child: ListView(
                        padding: const EdgeInsets.only(top: 0.0),
                        children: [
                          ChatHistoryComponent(
                            groupName: 'Car parking violation',
                            recentMessage: 'Alert for parking',
                            recentMessageTime: '12:09 pm',
                          ),
                          ChatHistoryComponent(
                            groupName: 'Car parking violation',
                            recentMessage: 'Alert for parking',
                            recentMessageTime: '12:09 pm',
                          ),
                          ChatHistoryComponent(
                            groupName: 'Car parking violation',
                            recentMessage: 'Alert for parking',
                            recentMessageTime: '12:09 pm',
                          ),
                          ChatHistoryComponent(
                            groupName: 'Car parking violation',
                            recentMessage: 'Alert for parking',
                            recentMessageTime: '12:09 pm',
                          ),
                          ChatHistoryComponent(
                            groupName: 'Car parking violation',
                            recentMessage: 'Alert for parking',
                            recentMessageTime: '12:09 pm',
                          ),
                          ChatHistoryComponent(
                            groupName: 'Car parking violation',
                            recentMessage: 'Alert for parking',
                            recentMessageTime: '12:09 pm',
                          ),
                        ],
                      )
                  )
                ],
              )
          )
      ),
    );
  }

  int? _sliding = 0;

  Future _displayAddChat(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      builder: (context) =>
          Container(
            padding: const EdgeInsets.all(15),
            height: 320,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeader(headerTitle: 'Add chat group'),
                const SizedBox(height: 10),
                const Text(
                  'Title',
                  style: TextStyle(
                    color: Color(0xFF070458),
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'New location name',
                      contentPadding: const EdgeInsets.all(5),
                      //filled: true,
                      //fillColor: const Color(0xFF9DAEC3),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(width: 1)
                      )
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Title',
                  style: TextStyle(
                    color: Color(0xFF070458),
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'New location name',
                      contentPadding: const EdgeInsets.all(5),
                      //filled: true,
                      //fillColor: const Color(0xFF9DAEC3),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(width: 1)
                      )
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF355992),
                          ),
                          child: const Text(
                            'Save',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          )
                      ),
                    )
                  ],
                )
              ],
            ),
          ),


    );
  }
}