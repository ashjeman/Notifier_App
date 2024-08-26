import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notifier_app/components/asset_inspection_component.dart';
import 'package:notifier_app/pages/add_inspection_dialog.dart';
import '../components/background_container.dart';
import '../components/custom_app_bar.dart';
import '../components/header.dart';
import '../components/nav_bar.dart';
import '../components/search_field.dart';

class AssetInspectionPage extends StatefulWidget {

  const AssetInspectionPage({
    super.key
  });

  @override
  State<AssetInspectionPage> createState() => _AssetInspectionPageState();
}

class _AssetInspectionPageState extends State<AssetInspectionPage> {
  DateTime inspectionDate = DateTime.now();
  TimeOfDay inspectionTime = TimeOfDay.now();

  DateTime inspectionDueDate = DateTime.now();
  TimeOfDay inspectionDueTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(
              appBarTitle: 'Asset Inspection'
          )
      ),
      bottomNavigationBar: NavBar(currentPageIndex: 2),
      body: Container(
          padding: const EdgeInsets.only(top: 70),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/app-bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackgroundContainer(
            boxHeight: 800,
            bgChild: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ContainerHeader(headerTitle: 'Asset Inspection'),
                    GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/addinspectiondialog'),
                        child: const Icon(Icons.add)
                    )
                  ],
                ),
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
                AssetInspectionComponent(
                    assetEquipment: 'Equipment name',
                    inspectionDate: '8/1/2024',
                    inspectionDueDate: '8/1/2024',
                    inspectedBy: 'Faisal',
                    assignedTo: 'Ahmad',
                    noOfItems: '1'
                ),
              ],
            ),

          )
      ),

    );
  }

  int? _sliding = 0;

  void toggleAssetForm(){
    setState(() {
      visible = !visible;
    });
  }
}
bool visible = false;
