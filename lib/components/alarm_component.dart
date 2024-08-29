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
              TextBoldGrey(boldText: 'Site is under construction. '),
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
                onSelected: selectAction,
                iconColor: const  Color(0xFF747474),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'Message',
                    child: ListTile(
                      contentPadding: EdgeInsets.all(1),
                      title: Text('Message'),
                      leading: Icon(Icons.forum),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'Playback',
                    child: ListTile(
                      title: Text('Playback'),
                      leading: Icon(Icons.play_arrow),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'Close Alarm',
                    child: ListTile(
                      title: Text('Close Alarm'),
                      leading: ImageIcon(AssetImage('assets/icons/alarm-off-icon.png')),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'Checklist',
                    child: ListTile(
                      title: Text('Checklist'),
                      leading: ImageIcon(AssetImage('assets/icons/checklist-icon.png')),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  void selectAction(String action){
    if(action == 'Message'){
      Navigator.pushNamed(context, '/chatpage');
    } else if(action == 'Playback'){
      //Navigate to Camera
    } else if(action == 'Close Alarm'){
      // Close Alarm
    } else if(action == 'Checklist'){
      Navigator.pushNamed(context, '/progresschecklistpage');
    }
  }
}
