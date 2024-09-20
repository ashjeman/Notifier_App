import 'package:flutter/material.dart';
import 'package:notifier_app/components/background_container.dart';
import 'package:notifier_app/components/header.dart';
import 'package:notifier_app/components/assets_components/options_component.dart';
import '../../components/custom_app_bar.dart';
import '../../components/nav_bar.dart';

class MessageOptionPage extends StatelessWidget {
  const MessageOptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CustomAppBar(
                appBarTitle: 'Messages'
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeader(headerTitle: 'Messages option'),
                  OptionsComponent(option: 'Alarm messages', optionImage: 'assets/icons/alarm-message-icon.png', nextPage: '/chathistorypage'),
                  OptionsComponent(option: 'Task messages', optionImage: 'assets/icons/task-message-icon.png', nextPage: '/chathistorypage'),
                ],
              )
          ),
        )
    );
  }
}
