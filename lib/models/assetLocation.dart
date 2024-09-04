import 'dart:convert';

AssetLocation assetLocationFromJson(String str) => AssetLocation.fromJson(json.decode(str));

String assetLocationToJson(AssetLocation data) => json.encode(data.toJson());

class AssetLocation {
  int id;
  String? name;
  int siteid;
  int? itemcount;

  AssetLocation({
    required this.id,
    this.name,
    required this.siteid,
    this.itemcount,
  });

  factory AssetLocation.fromJson(Map<String, dynamic> json) => AssetLocation(
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