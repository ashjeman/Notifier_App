import 'package:flutter/material.dart';
import 'package:notifier_app/components/edit_location.dart';
import 'package:notifier_app/components/text_bold_grey.dart';
import 'package:notifier_app/components/text_grey.dart';
import 'package:notifier_app/components/traffic_indicator.dart';

class AssetLocationsComponent extends StatelessWidget {
  final String locationName;
  final String noOfAssets;

  AssetLocationsComponent({
    super.key,
    required this.locationName,
    required this.noOfAssets,
  });

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
              TextBoldGrey(boldText: locationName),
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
          TextGrey(textDetails: noOfAssets),
          const SizedBox(height: 15),
          const Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  backgroundColor: const Color(0xFF8D97A5),
                  value: 0.7,
                  minHeight: 10,
                  valueColor: AlwaysStoppedAnimation<Color>(const Color(0xFF355992)),
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
      showDialog(
        context: context,
        builder: (BuildContext context) => EditLocation(),
      );
    } else if (action == 'Delete') {
      // Navigate to User List
    }
  }
}
