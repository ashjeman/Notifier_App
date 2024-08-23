import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notifier_app/components/chat_history_component.dart';

import '../components/asset_locations_component.dart';
import '../components/background_container.dart';
import '../components/custom_app_bar.dart';
import '../components/header.dart';
import '../components/nav_bar.dart';
import '../components/search_field.dart';

class ChatHistoryPage extends StatefulWidget {
  const ChatHistoryPage({super.key});

  @override
  State<ChatHistoryPage> createState() => _ChatHistoryPageState();
}

class _ChatHistoryPageState extends State<ChatHistoryPage> {
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
        bottomNavigationBar: NavBar(currentPageIndex: 3),
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
                    ChatHistoryComponent(
                      groupName: 'Car parking violation',
                      recentMessage: 'Alert for parking',
                      recentMessageTime: '12:09 pm',
                    )
                  ]
                )
                  ],
            )
          )
        ),
    );
  }
  int? _sliding = 0;
}
