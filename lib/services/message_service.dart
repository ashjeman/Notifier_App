/*
import 'dart:async';

import 'package:chatview/chatview.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:notifier_app/controller.dart';

import '../models/message.dart';
class MessageService{

  late Controller controller;

  MessageService(){
    controller = Get.put(Controller());
  }

  final StreamController<List<Message>> messageController = StreamController<List<Message>>.broadcast();
  List<Message> messageList = [];

  Stream<List<Message>> get messagesStream => messageController.stream;

  Future<List<Message>> getMessages() async {
    var client = http.Client();
    var uri = Uri.parse('http://13.126.15.56:180/api/AlarmChat/GetAllAlarm?userId=152&alarmId=128402');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      print("Success ${response.statusCode}");

      // Deserialize the JSON to Messages objects
      List<Messages> messages = messageFromJson(json);

      // Map Messages to Message format
      messageList = messages.map((msg) => Message(
        id: msg.id.toString(), // Assuming id is an int, convert to string
        message: msg.msg,
        createdAt: msg.dateTime,
        sentBy: msg.userId.toString(), // Assuming userId is an int, convert to string
      )).toList();

      // Add mapped messages to the stream
      messageController.add(messageList);

      return messageList;
    } else {
      print("Error ${response.statusCode}");
    }
    return [];
  }

  //Send message without media
  Future<Messages?> sendMessage(int alarmId, String message, String username, int siteId) async{
    var client = http.Client();

    //convert String to URL type
    String encodedMessage = Uri.encodeComponent(message);
    String encodedUsername = Uri.encodeComponent(username);

    var uri = Uri.parse('http://13.126.15.56:180/api/AlarmChat/AddAlarmMsg?alarmId=$alarmId&userid=${controller.userId.value}&msg=$encodedMessage&username=$encodedUsername&siteId=$siteId');
    var response = await client.get(uri);
    if (response.statusCode == 200){
      var json = response.body;
      //return messageFromJson(json);
    }
    return null;
  }

  Future<Messages?> sendMessageWithMedia(int alarmId, String message, String username, int siteId, String? filePath) async{
    //convert String to URL type
    String encodedMessage = Uri.encodeComponent(message);
    String encodedUsername = Uri.encodeComponent(username);
    String encodedUrl = Uri.encodeComponent("");
    // Construct the URI
    var uri = Uri.parse('http://13.126.15.56:180/api/AlarmChat/AddAlarmContent?alarmId=$alarmId&userid=${controller.userId.value}&msg=$encodedMessage&url=$encodedUrl&username=$encodedUsername&siteId=$siteId');

    // Prepare the multipart request
    var request = http.MultipartRequest('POST', uri);

    // Add the file if available
    if (filePath != null && filePath.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath('file', filePath));
    }

    // Send the request and handle the response
    var response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      print('File & data uploaded successfully');
      print('Response body: $responseBody');
      // Parse and return Message object if necessary
    } else {
      print('Failed to upload');
      print('Response body: $responseBody');
    }

    return null;
  }
}
 */