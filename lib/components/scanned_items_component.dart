import 'package:flutter/material.dart';
import 'package:notifier_app/components/text_bold_grey.dart';
import 'package:notifier_app/components/text_grey.dart';

class ScannedItemsComponent extends StatelessWidget {
  const ScannedItemsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFE9E9E9),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextBoldGrey(boldText: 'LVL 1/PHB2B'),
              TextGrey(textDetails: 'Location: LVL 1/PH 2B BE TEPE'),
              TextGrey(textDetails: 'Inspected by: azmina@servosecurity.my'),
              TextGrey(textDetails: 'Total items: 1')
            ],
          ),
          const Expanded(child: SizedBox()),
          PopupMenuButton(
            onSelected: (action) => selectAction(context, action),
            iconColor: const Color(0xFF747474),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'Edit',
                child: ListTile(
                  title: Text('Edit'),
                  leading: ImageIcon(AssetImage('assets/icons/edit-icon.png')),
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
    );
  }

  void selectAction(BuildContext context, String action){
    if (action == 'Edit') {
      Navigator.pushNamed(context, '/assetdetailspage');
    } else if (action == 'Delete') {
      // Navigate to Delete'
    }
  }
}
