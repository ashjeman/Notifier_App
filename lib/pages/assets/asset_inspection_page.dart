import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notifier_app/components/assets_components/asset_inspection_component.dart';
import '../../components/background_container.dart';
import '../../components/custom_app_bar.dart';
import '../../components/header.dart';
import '../../components/search_field.dart';

class AssetInspectionPage extends StatefulWidget {

  const AssetInspectionPage({
    super.key
  });

  @override
  State<AssetInspectionPage> createState() => _AssetInspectionPageState();
}

class _AssetInspectionPageState extends State<AssetInspectionPage> {

  TextEditingController controller = TextEditingController();

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
      //bottomNavigationBar: NavBar(currentPageIndex: 2),
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
                SearchField(controller: controller, onChanged: (String ) {  },),
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
                    assetEquipment: 'Fire Ext',
                    inspectionDate: '8/1/2024',
                    inspectionDueDate: '8/1/2024',
                    inspectedBy: 'Faisal',
                    assignedTo: 'Ahmad',
                    noOfItems: '1'
                )
              ],
            ),

          )
      ),

    );
  }

  int? _sliding = 0;

  Future _displaySettings(BuildContext context){
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      builder: (context) => Container(
        padding: const EdgeInsets.all(15),
        height: 180,
        width: MediaQuery.of(context).size.width,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContainerHeader(headerTitle: 'Scan QR code'),
            SizedBox(height: 10),
            Text(
              'Select site',
              style: TextStyle(
                color: Color(0xFF070458),
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),


    );
  }



}

