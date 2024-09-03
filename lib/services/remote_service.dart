import 'package:http/http.dart' as http;
import 'package:notifier_app/models/allAssetLocation.dart';
import 'package:notifier_app/models/allSite.dart';

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
    }
    return null;
  }
}