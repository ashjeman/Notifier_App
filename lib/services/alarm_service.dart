import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:notifier_app/models/allAlarm.dart';

import '../controller.dart';

class AlarmService{

  int? alarmId;

  late Controller controller;

  AlarmService(){
    controller = Get.put(Controller());
    alarmId;
  }

  Future<List<AllAlarm>?> getAllAlarm() async {
    var client = http.Client();
    var uri = Uri.parse('http://13.126.15.56:180/api/Alarm/GetAllAlarm?userId=${controller.userId.value}&siteId=${controller.siteId.value}');
    var response = await client.get(uri);

    if (response.statusCode == 200){
      var json = response.body;
      print("Success ${response.statusCode}");
      return allAlarmFromJson(json);
    }else{
      print("Error ${response.statusCode}");
    }
    return null;
  }

  Future<String?> updateAlarmState(int alarmId) async{
    this.alarmId = alarmId;
    var client = http.Client();
    var uri = Uri.parse('http://13.126.15.56:180/api/Alarm/UpdateAlarmState?alarmId=$alarmId&userId=${controller.userId.value}');
    var response = await client.get(uri);

    if (response.statusCode == 200){
      print("Success ${response.statusCode}");
      return response.body;
    }else{
      print("Error ${response.statusCode}");
    }

    return null;
  }



  /*
  Future<List<AllAlarm>?> editAlarm(int id, String escState) async {
    Map<String, dynamic> request ={
      'id': id,
      'escState': escState
    };

    var client = http.Client();
    var uri = Uri.parse('http://vm.eleware.net/api/Alarm/GetAllAlarm?userId=152&siteId=1');
    var response = await client.put(
      uri,
      body: jsonEncode(request), // Encode the request map to JSON
      headers: {'Content-Type': 'application/json'}
    );
    if (response.statusCode == 200){
      var json = response.body;
      print("success");
      return allAlarmFromJson(json);
    }else{
      print("cannot do. Error ${response.statusCode}");
    }
    return null;
  }
   */

}