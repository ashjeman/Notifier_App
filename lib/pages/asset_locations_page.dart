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
        resizeToAvoidBottomInset : true,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ContainerHeader(headerTitle: 'Location List'),
                      GestureDetector(
                        onTap: () {
                          _addLocation(context);
                        },
                        child: const Icon(Icons.add, size: 28),
                      )
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

  Future _addLocation(BuildContext context){
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      builder: (context) => Container(
        padding: const EdgeInsets.all(15),
        height: 250,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ContainerHeader(headerTitle: 'Add asset location'),
            const SizedBox(height: 10),
            const Text(
              'Location name',
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
                  child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
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
