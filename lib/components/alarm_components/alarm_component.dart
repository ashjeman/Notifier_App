import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:notifier_app/components/text_bold_grey.dart';
import 'package:notifier_app/components/text_grey.dart';
import 'package:notifier_app/components/traffic_indicator.dart';
import 'package:notifier_app/services/alarm_service.dart';
import 'package:video_player/video_player.dart';

class AlarmComponent extends StatefulWidget {
  String? alarmTitle;
  String? alarmGroup;
  int alarmId;
  DateTime? dateTime;
  String mediaLink;

  AlarmComponent({
    super.key,
    required this.alarmTitle,
    required this.alarmGroup,
    required this.alarmId,
    required this.dateTime,
    required this.mediaLink
  });

  @override
  State<AlarmComponent> createState() => _AlarmComponentState();
}

class _AlarmComponentState extends State<AlarmComponent> {

  late VideoPlayerController videoPlayerController;
  late FlickManager flickManager;
  Future<void>? initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    if (widget.mediaLink == ''){
      print('No media found');

    }else if (widget.mediaLink.toLowerCase().endsWith('jpg')){
      widget.mediaLink = "http://vm.eleware.net${widget.mediaLink}";

    }else if (widget.mediaLink.toLowerCase().endsWith('mp4')){
      flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(
            Uri.parse(widget.mediaLink)
        )..initialize().then((_) {
          setState(() {}); // Trigger rebuild once the video is initialized
        }),
      );
    }else{
      print('Unknown media format');
    }
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  void closeAlarm(){
    AlarmService().updateAlarmState(widget.alarmId);
  }

  Future<void> watchMedia(BuildContext context) async {

    if (widget.mediaLink == ''){
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alarm media'),
            content: const Text("No media attached"),
            actions: <Widget>[
              TextButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

    }else if (widget.mediaLink.toLowerCase().endsWith('jpg')){
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alarm media'),
            content: Image.network(widget.mediaLink),
            actions: <Widget>[
              TextButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

    }else if (widget.mediaLink.toLowerCase().endsWith('mp4')){
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alarm media'),
            content: SizedBox(
                width: double.maxFinite,
                height: 200,
                child: FlickVideoPlayer(flickManager: flickManager)
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }else{
      print('Unknown media format');
    }
  }

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
              Expanded(
                child: TextBoldGrey(boldText: widget.alarmTitle!),
              ),
              //Row(
              //  children: [
              //    TrafficIndicator(indicatorColor: Colors.red),
              //    const SizedBox(width: 5),
              //    TextBoldGrey(boldText: 'High'),
              //  ],
              //),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextGrey(textDetails: widget.alarmGroup!),
                  TextGrey(textDetails: widget.dateTime.toString())
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
      watchMedia(context);
      //Navigator.pushNamed(context, '/alarmmedia');
    } else if(action == 'Close Alarm'){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Close this alarm?"),
          action: SnackBarAction(
            label: 'Confirm',
            onPressed: (){
              closeAlarm();
            }
            ),
          duration: const Duration(milliseconds: 3000),
        ),
      );
    } else if(action == 'Checklist'){
      Navigator.pushNamed(context, '/progresschecklistpage');
    }
  }

}
