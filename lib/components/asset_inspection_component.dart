import 'package:flutter/material.dart';

import 'package:notifier_app/components/text_bold_grey.dart';
import 'package:notifier_app/components/text_grey.dart';

class AssetInspectionComponent extends StatefulWidget {

  String assetEquipment;
  String inspectionDate;
  String inspectionDueDate;
  String inspectedBy;
  String assignedTo;
  String noOfItems;

  AssetInspectionComponent({
    super.key,
    required this.assetEquipment,
    required this.inspectionDate,
    required this.inspectionDueDate,
    required this.inspectedBy,
    required this.assignedTo,
    required this.noOfItems
  });

  @override
  State<AssetInspectionComponent> createState() => _AssetInspectionComponentState();
}

class _AssetInspectionComponentState extends State<AssetInspectionComponent> {

  confirmFinishInspection(BuildContext context) {

    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Inspection Alert"),
      content: Text("Are you sure you want to finish this inspection?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/scanneditemspage'),
      child: Container(
        padding: const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 15),
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
                TextBoldGrey(boldText: widget.assetEquipment),
                PopupMenuButton(
                  onSelected: selectAction,
                  iconColor: const Color(0xFF747474),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'Finish Inspection',
                      child: ListTile(
                        title: Text('Finish Inspection'),
                        leading: ImageIcon(AssetImage('assets/icons/finish-inspection-icon.png')),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'Delete',
                      child: ListTile(
                        title: Text('Delete'),
                        leading: ImageIcon(AssetImage('assets/icons/delete-icon.png')),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            TextGrey(textDetails: 'Inspection date: ${widget.inspectionDate}'),
            TextGrey(textDetails: 'Inspection due date: ${widget.inspectionDueDate}'),
            TextGrey(textDetails: 'Inspected by: ${widget.inspectedBy}'),
            TextGrey(textDetails: 'Assigned to: ${widget.assignedTo}'),
            TextGrey(textDetails: 'Total items: ${widget.noOfItems}'),
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
      )
    );
  }

  void selectAction(String action){
    if (action == 'Finish Inspection') {
      confirmFinishInspection(context);
    } else if (action == 'Delete') {
      // Delete from database
    }
  }
}
