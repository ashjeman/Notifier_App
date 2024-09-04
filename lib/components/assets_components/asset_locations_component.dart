import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notifier_app/components/text_bold_grey.dart';
import 'package:notifier_app/components/text_grey.dart';

import '../../models/assetLocation.dart';
import '../../services/remote_service.dart';
import '../header.dart';

class AssetLocationsComponent extends StatefulWidget {
  String locationName;
  int locationId;
  final String noOfAssets;

  AssetLocationsComponent({
    super.key,
    required this.locationName,
    required this.locationId,
    required this.noOfAssets,
  });

  @override
  State<AssetLocationsComponent> createState() => _AssetLocationsComponentState();
}

class _AssetLocationsComponentState extends State<AssetLocationsComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 15),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFE9E9E9),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextBoldGrey(boldText: widget.locationName),
              PopupMenuButton<String>(
                onSelected: (String action) => selectAction(action, context), // Corrected closure
                iconColor: const Color(0xFF747474),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'Edit',
                    child: ListTile(
                      title: Text('Edit'),
                      leading: Icon(Icons.edit),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'Delete',
                    child: ListTile(
                      title: Text('Delete'),
                      leading: Icon(Icons.delete),
                    ),
                  ),
                ],
              ),
            ],
          ),
          TextGrey(textDetails: '${widget.noOfAssets} assets'),
          const SizedBox(height: 15),
          const Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  backgroundColor: Color(0xFF8D97A5),
                  value: 0.7,
                  minHeight: 10,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF355992)),
                ),
              ),
              SizedBox(width: 7),
              Text(
                '70%',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void selectAction(String action, BuildContext context) {
    if (action == 'Edit') {
      _editLocation(context);
    } else if (action == 'Delete') {
      RemoteService().deleteAssetLocation(widget.locationId);
    }
  }

  Future _editLocation(BuildContext context){
    TextEditingController controller = TextEditingController();
    Future<AssetLocation?> assetLocation;

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
            const ContainerHeader(headerTitle: 'Edit location name'),
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
                  hintText: widget.locationName
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(onPressed: (){
                    String editLocationName = controller.text;

                    assetLocation = RemoteService().editAssetLocation(widget.locationId, editLocationName);
                    //print(widget.locationId);
                    Navigator.pop(context);
                  },
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
