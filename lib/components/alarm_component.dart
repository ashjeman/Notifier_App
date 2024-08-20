import 'package:flutter/material.dart';
import 'package:notifier_app/components/text_bold_grey.dart';
import 'package:notifier_app/components/text_grey.dart';
import 'package:notifier_app/components/traffic_indicator.dart';

class AlarmComponent extends StatefulWidget {
  const AlarmComponent({super.key});

  @override
  State<AlarmComponent> createState() => _AlarmComponentState();
}

class _AlarmComponentState extends State<AlarmComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
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
              TextBoldGrey(boldText: 'Site is under construction. (Alarm Title)'),
              Row(
                children: [
                  TrafficIndicator(indicatorColor: Colors.red),
                  const SizedBox(width: 5),
                  TextBoldGrey(boldText: 'High'),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextGrey(textDetails: 'CCTV (Alarm Group)'),
                  TextGrey(textDetails: '30/3/2024')
                ],
              ),
              PopupMenuButton(
                iconColor: const  Color(0xFF747474),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'Message',
                    child: Text('Message'),
                  ),
                  const PopupMenuItem(
                    value: 'Camera',
                    child: Text('Camera'),
                  ),
                  const PopupMenuItem(
                    value: 'Close Alarm',
                    child: Text('Close Alarm'),
                  ),
                  const PopupMenuItem(
                    value: 'Check List',
                    child: Text('Check List'),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
