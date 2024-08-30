import 'package:flutter/material.dart';
import 'package:notifier_app/components/background_container.dart';
import 'package:notifier_app/components/header.dart';
import 'package:notifier_app/components/options_component.dart';
import '../components/custom_app_bar.dart';
import '../components/nav_bar.dart';

class AssetOptionPage extends StatelessWidget {
  const AssetOptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
            appBarTitle: 'Assets'
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
              const ContainerHeader(headerTitle: 'Asset option'),
              OptionsComponent(option: 'Assets location', optionImage: 'assets/icons/asset-list-icon.png', nextPage: '/assetlocationpage'),
              OptionsComponent(option: 'Inspections', optionImage: 'assets/icons/asset-inspection-icon.png', nextPage: '/assetinspectionpage'),
              OptionsComponent(option: 'Expiring assets', optionImage: 'assets/icons/asset-expiring-icon.png', nextPage: '/assetitemspage')
            ],
          )
        ),
      )
    );
  }
}
