import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:notifier_app/models/allAlarm.dart';

class AlarmService{

  Future<List<AllAlarm>?> getAllAlarm() async {
    var client = http.Client();
    var uri = Uri.parse('http://13.126.15.56:180/api/Alarm/GetAllAlarm?userId=152&siteId=1');
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