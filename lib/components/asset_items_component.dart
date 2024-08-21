import 'package:flutter/material.dart';
import 'package:notifier_app/components/text_bold_grey.dart';
import 'package:notifier_app/components/text_grey.dart';
import 'package:notifier_app/components/traffic_indicator.dart';

class AssetItemsComponent extends StatelessWidget {
  const AssetItemsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: const Color(0xFFE9E9E9),
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Row(
        children: [
          Container(
            child: Image.asset(
              'assets/images/profile.png',
              width: 80,
              height: 80,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.devices, color: Color(0xFF616260)),
                  const SizedBox(width: 10),
                  TextBoldGrey(boldText: 'Desktop')
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.new_releases, color: Color(0xFF616260)),
                  const SizedBox(width: 10),
                  TextBoldGrey(boldText: 'Acer')
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Color(0xFF616260)),
                  const SizedBox(width: 10),
                  TextBoldGrey(boldText: 'Lobby')
                ],
              ),
            ],
          ),
          const  SizedBox(width: 120),
          PopupMenuButton(
            onSelected: (action) => selectAction(context, action),
            iconColor: const Color(0xFF747474),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'View',
                child: ListTile(
                  title: Text('View'),
                  leading: Icon(Icons.visibility),
                ),
              ),
              const PopupMenuItem(
                value: 'History',
                child: ListTile(
                  title: Text('History'),
                  leading: Icon(Icons.history),
                ),
              ),
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
      )
    );
  }

  void selectAction(BuildContext context, String action){
    if (action == 'View') {
      // Navigate to View
    } else if (action == 'History') {
      Navigator.pushNamed(context, '/edithistorypage');
    }
    else if (action == 'Edit') {
      Navigator.pushNamed(context, '/editassetpage');
    }
    else if (action == 'Delete') {
      // Navigate to Delete'
    }
  }
}
