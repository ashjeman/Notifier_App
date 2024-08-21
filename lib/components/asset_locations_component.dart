import 'package:flutter/material.dart';
import 'package:notifier_app/components/text_bold_grey.dart';
import 'package:notifier_app/components/text_grey.dart';
import 'package:notifier_app/components/traffic_indicator.dart';

class AssetLocationsComponent extends StatelessWidget {
  String locationName;
  String noOfAssets;

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
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextBoldGrey(boldText: locationName),
              PopupMenuButton(
                onSelected: selectAction,
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
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  backgroundColor: const Color(0xFF8D97A5),
                  value: 0.7,
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF355992),
                ),
              ),
              const SizedBox(width: 7),
              const Text(
                '70%',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 12),
              )
            ],
          ),
        ],
      ),
    );
  }

  void selectAction(String action){
    if (action == 'Edit') {
      // Navigate to Check List
    } else if (action == 'Delete') {
      // Navigate to User List
    }
  }
}
