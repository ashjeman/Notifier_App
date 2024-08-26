import 'package:flutter/material.dart';

import '../components/asset_locations_component.dart';
import '../components/background_container.dart';
import '../components/custom_app_bar.dart';
import '../components/header.dart';
import '../components/nav_bar.dart';
import '../components/search_field.dart';

class AssetLocationsPage extends StatefulWidget {
  const AssetLocationsPage({super.key});

  @override
  State<AssetLocationsPage> createState() => _AssetLocationsPageState();
}

class _AssetLocationsPageState extends State<AssetLocationsPage> {
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
          child: BackgroundContainer(
              boxHeight: 800,
              bgChild: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ContainerHeader(headerTitle: 'Location List'),
                      Icon(
                        Icons.add,
                        size: 28,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const SearchField(),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      AssetLocationsComponent(
                          locationName: 'Lobby',
                          noOfAssets: '3 Assets'
                      )
                    ],
                  )
                ],
              )
          ),
        )
    );
  }

  int? _sliding = 0;
}
