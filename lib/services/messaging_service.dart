import 'package:chatview/chatview.dart';
import 'package:notifier_app/controller.dart';
import 'package:http/http.dart' as http;
import 'package:notifier_app/models/message.dart';

class MessagingService{
  late Controller controller;

  Future<List<Messages>> getMessages() async{
    var client = http.Client();
    var uri = Uri.parse('http://13.126.15.56:180/api/AlarmChat/GetAllAlarm?userId=152&alarmId=128402');
    var response = await client.get(uri);

    if(response.statusCode == 200){
      var json = response.body;
      print ("Success ${response.statusCode}");
      return messageFromJson(json);
    } else{
      print ("Success ${response.statusCode}");
    }
    return [];
  }
}