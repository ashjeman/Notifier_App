import 'dart:convert';

List<AllAssetLocation> allAssetLocationFromJson(String str) => List<AllAssetLocation>.from(json.decode(str).map((x) => AllAssetLocation.fromJson(x)));

String allAssetLocationToJson(List<AllAssetLocation> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllAssetLocation {
  int id;
  String name;
  int siteid;
  int? itemcount;

  AllAssetLocation({
    required this.id,
    required this.name,
    required this.siteid,
    this.itemcount,
  });

  factory AllAssetLocation.fromJson(Map<String, dynamic> json) => AllAssetLocation(
    id: json["id"],
    name: json["name"],
    siteid: json["siteid"],
    itemcount: json["itemcount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "siteid": siteid,
    "itemcount": itemcount,
  };
}