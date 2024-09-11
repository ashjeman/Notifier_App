import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:notifier_app/models/AllAlarm.dart';
import 'package:notifier_app/models/ManualAlarm.dart';

import '../controller.dart';
class ManualAlarmService{

  late Controller controller;

  ManualAlarmService(){
    controller = Get.put(Controller());
  }

  Future<void> createManualAlarm(int userId, String message, int siteId, int alarmGroupId, EscalationState escalationState, File? file) async{
    var uri = Uri.parse('http://13.126.15.56:180/api/ManualAlarm/CreateOrUpdateAlarm');
    var request = http.MultipartRequest('POST', uri);

    if(file != null){
      request.files.add(await http.MultipartFile.fromPath('file', file.path));
    }

    request.fields['user_id'] = userId.toString();
    request.fields['message'] = message;
    request.fields['submission_date_time'] = DateTime.now().toString();
    request.fields['site_id'] = siteId.toString();
    request.fields['alarm_group_id'] = alarmGroupId.toString();
    request.fields['timestamp'] = DateTime.now().toString();
    request.fields['escalation_state'] = escalationState.toString();

    var response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if(response.statusCode == 200){
      print('File & data uploaded successfully');
      print('Response body: $responseBody');
    }else{
      print('Failed to upload');
      print('Response body: $responseBody');
    }
  }
}