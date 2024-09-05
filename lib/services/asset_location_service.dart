import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:notifier_app/models/allAssetLocation.dart';
import 'package:notifier_app/models/allSite.dart';
import 'package:notifier_app/models/assetLocation.dart';

class RemoteService{

  Future<List<AllAssetLocation>?> getAllAssetLocations() async {
    var client = http.Client();
    
    var uri = Uri.parse('http://13.126.15.56:180/api/AssetLocation/GetAllAssetLocation?siteId=1');
    var response = await client.get(uri);
    if (response.statusCode == 200){
      var json = response.body;
      return allAssetLocationFromJson(json);
    }
    return null;
  }

  Future<List<AllSite>?> getAllSite() async {
    var client = http.Client();

    var uri = Uri.parse('http://13.126.15.56:180/api/Site/GetAllSite?userId=152');
    var response = await client.get(uri);
    if (response.statusCode == 200){
      var json = response.body;
      return allSiteFromJson(json);
    }else {
      print('failed');
      log('failed');
    }
    return null;
  }

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

  Future<AssetLocation?> editAssetLocation(int id, String name) async {
    Map<String, dynamic> request = {
      'id': id,
      'name': name,
    };
    var client = http.Client();
    var uri = Uri.parse('http://13.126.15.56:180/api/AssetLocation');
    var response = await client.put(
      uri,
      body: jsonEncode(request), // Encode the request map to JSON
      headers: {'Content-Type': 'application/json'}, // Set content type to JSON
    );
    if (response.statusCode == 200){
      var json = response.body;
      print("success");
      return assetLocationFromJson(json);
    }else{
      print("cannot do. Error ${response.statusCode}");
    }
    return null;
  }

  Future<AssetLocation?> deleteAssetLocation(int id) async {
    /*Map<String, dynamic> request = {
      'id': id,
    };*/
    var client = http.Client();
    var uri = Uri.parse('http://13.126.15.56:180/api/AssetLocation?id=$id');
    var response = await client.delete(uri);

    if (response.statusCode == 200){
      var json = response.body;
      print("success");
      return assetLocationFromJson(json);
    }else{
      print("cannot do. Error ${response.statusCode}");
    }
    return null;
  }
}