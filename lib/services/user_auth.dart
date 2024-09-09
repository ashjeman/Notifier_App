import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:notifier_app/controller.dart';

import 'package:notifier_app/models/userDetails.dart';

class UserAuth{

  late Controller controller;

  UserAuth(){
    controller = Get.put(Controller());
  }

  Future<UserDetails?> sendOtp(String mobileNumber) async {
    Map<String, dynamic> request = {
      "u_Mobile_Number": mobileNumber,
    };
    var client = http.Client();
    var uri = Uri.parse('http://vm.eleware.net/api/User/Auth');
    var response = await client.put(
      uri,
      body: jsonEncode(request), // Encode the request map to JSON
      headers: {'Content-Type': 'application/json'}, // Set content type to JSON
    );
    var json = response.body;
    final responseBody = jsonDecode(response.body);

    if(responseBody['u_Name'] == null){
      print('Phone number not registered');
    }else{
      controller.userId.value = responseBody['id'];
      controller.userName.value = responseBody['u_Name'];
      controller.emailAddress.value = responseBody['u_Email_Address'];
      controller.mobileNo.value = responseBody['u_Mobile_Number'];
      controller.authCode.value = responseBody['authCode'];
      print("success");
      print('OTP Code is: ${controller.authCode.value}');
      return userDetailsFromJson(json);
    }

    return null;
  }
}