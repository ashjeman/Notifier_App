import 'package:get/get.dart';

class Controller extends GetxController{
  //Not efficient. should use late. but got null error. figure out later. 9/9
  RxInt userId = 0.obs;
  RxString userName = ''.obs;
  RxString emailAddress = ''.obs;
  RxString mobileNo = ''.obs;
  RxString authCode = ''.obs;

  RxInt siteId = 1.obs;

  RxBool registered = false.obs;
}