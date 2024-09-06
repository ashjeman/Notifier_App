import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller.dart';
import '../models/allAssetItems.dart';
import 'package:http/http.dart' as http;

class AssetItemsService{

  Future<List<AllAssetItems>?> getAllAssetItems() async {
    var client = http.Client();
    var uri = Uri.parse('http://13.126.15.56:180/api/Asset/GetAsset?userId=152');
    var response = await client.get(uri);
    if (response.statusCode == 200){
      var json = response.body;
      print("Success ${response.statusCode}");
      return allAssetItemsFromJson(json);
    }else{
      print("Error ${response.statusCode}");
    }
    return null;
  }
}