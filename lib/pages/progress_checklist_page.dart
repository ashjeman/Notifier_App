import 'package:flutter/material.dart';
import '../components/custom_app_bar.dart';
import '../components/nav_bar.dart';

class ProgressChecklistPage extends StatefulWidget {
  const ProgressChecklistPage({super.key});

  @override
  State<ProgressChecklistPage> createState() => _ProgressChecklistPageState();
}

class _ProgressChecklistPageState extends State<ProgressChecklistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CustomAppBar(
                appBarTitle: 'Checklist'
            )
        ),
        bottomNavigationBar: const  NavBar(currentPageIndex: 2),
        body: Container(
        padding: const EdgeInsets.only(top: 70),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/app-bg.png'),
            fit: BoxFit.cover, // This makes sure the image covers the entire background
            ),
          )
        )
    );
  }
}
