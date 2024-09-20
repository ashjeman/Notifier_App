import 'package:flutter/material.dart';
import 'package:notifier_app/models/allAssetLocation.dart';
import 'package:notifier_app/models/assetLocation.dart';
import 'package:notifier_app/services/asset_location_service.dart';

import '../../components/assets_components/asset_locations_component.dart';
import '../../components/background_container.dart';
import '../../components/custom_app_bar.dart';
import '../../components/header.dart';
import '../../components/search_field.dart';
import '../../models/allSite.dart';

class AssetLocationsPage extends StatefulWidget {
  const AssetLocationsPage({super.key});

  @override
  State<AssetLocationsPage> createState() => _AssetLocationsPageState();
}

class _AssetLocationsPageState extends State<AssetLocationsPage> {
  List<AllAssetLocation>? allAssetLocations;
  List<AllSite>? allSites;
  var isLoaded = false;
  int _value = 1;

  List<AllAssetLocation>? foundLocations = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    allAssetLocations = await AssetLocationService().getAllAssetLocations();
    allSites = await AssetLocationService().getAllSite();

    if (allAssetLocations != null) {
      setState(() {
        isLoaded = true;
        foundLocations = allAssetLocations; // Initialize foundLocations after loading data
      });
    }
  }

  void runFilter(String userInput) {
    List<AllAssetLocation>? results = [];

    if (userInput.isEmpty) {
      results = allAssetLocations; // Use the original list if no input is provided
    } else if (allAssetLocations != null) {
      results = allAssetLocations!.where((location) =>
          location.name.toLowerCase().contains(userInput.toLowerCase())).toList();
    }

    setState(() {
      foundLocations = results;
    });
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(appBarTitle: 'Asset Location')),
      //bottomNavigationBar: NavBar(currentPageIndex: 0),
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
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _siteOption(context);
                          },
                          child: const Icon(Icons.explore, size: 28),
                        ),
                        GestureDetector(
                          onTap: () {
                            _addLocation(context);
                          },
                          child: const Icon(Icons.add, size: 28),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                SearchField(controller: controller, onChanged: (userInput) => runFilter(userInput)),
                const SizedBox(height: 10),
                Expanded(
                    child: isLoaded
                        ? ListView.builder(
                        padding: const EdgeInsets.only(top: 0.0),
                        itemCount: foundLocations?.length,
                        itemBuilder: (context, index) {
                          //components/assets_components/asset_locations_component.dart
                          return AssetLocationsComponent(
                              locationName: foundLocations![index].name,
                              noOfAssets: foundLocations![index].itemcount.toString(),
                              locationId: foundLocations![index].id
                          );
                        })
                        : const Center(child: CircularProgressIndicator())
                ),
              ],
            )),
      ),
    );
  }

  Future _addLocation(BuildContext context) {
    TextEditingController controller = TextEditingController();
    Future<AssetLocation?> assetLocation;

    @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }

    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
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
              controller: controller,
              decoration: InputDecoration(
                  hintText: 'New location name',
                  contentPadding: const EdgeInsets.all(5),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 1))),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        String newLocationName = controller.text;
                        getData();

                        setState(() {
                          assetLocation = AssetLocationService().createAssetLocation(newLocationName, 1, 0);
                        });

                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF355992),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future _siteOption(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(15),
        height: 250,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ContainerHeader(headerTitle: 'Site option'),
            const SizedBox(height: 10),
            const Text(
              'Choose site',
              style: TextStyle(
                color: Color(0xFF070458),
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 10),
            DropdownButton(
                value: _value,
                items: allSites?.map((e) {
                  return DropdownMenuItem(
                    value: e.id,
                    child: Text("${e.siteName}"),
                  );
                }).toList(),
                onChanged: (v) {
                  setState(() {
                    _value = v as int;
                  });
                }),
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
