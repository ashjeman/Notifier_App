import 'dart:convert';

import 'package:http/http.dart' as http;
class ManualAlarmService{

  createManualAlarm(int userId, String message, int siteId, int alarmGroupId) async{
    Map<String, dynamic> request = {
      'user_id': userId,
      'message': message,
      'site_id': siteId,
      'alarm_group_id': alarmGroupId
    };
    var client = http.Client();
    var uri = Uri.parse('http://13.126.15.56:180/api/AssetLocation');
    var response = await client.post(
      uri,
      body: jsonEncode(request), // Encode the request map to JSON
      headers: {'Content-Type': 'application/json'}, // Set content type to JSON
    );
    if (response.statusCode == 200){
      //var json = response.body;
      //return assetLocationFromJson(json);
      print('Success');
    }
    return null;
  }

  /*
  Future<AssetLocation?> createAssetLocation(String name, int siteid, int itemcount) async {
    Map<String, dynamic> request = {
      'name': name,
      'siteid': siteid,
      'itemcount': itemcount
    };
    var client = http.Client();
    var uri = Uri.parse('http://13.126.15.56:180/api/AssetLocation');
    var response = await client.post(
      uri,
      body: jsonEncode(request), // Encode the request map to JSON
      headers: {'Content-Type': 'application/json'}, // Set content type to JSON
    );
    if (response.statusCode == 200){
      var json = response.body;
      return assetLocationFromJson(json);
    }
    return null;
  }
   */
}