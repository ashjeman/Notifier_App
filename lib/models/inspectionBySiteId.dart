import 'dart:convert';

List<InspectionBySiteId> inspectionBySiteIdFromJson(String str) => List<InspectionBySiteId>.from(json.decode(str).map((x) => InspectionBySiteId.fromJson(x)));

String inspectionBySiteIdToJson(List<InspectionBySiteId> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InspectionBySiteId {
  int id;
  String name;
  int siteId;
  int status;
  int? itemcount;
  int? userId;
  DateTime? dateTime;
  String? userName;

  InspectionBySiteId({
    required this.id,
    required this.name,
    required this.siteId,
    required this.status,
    this.itemcount,
    this.userId,
    this.dateTime,
    this.userName,
  });

  factory InspectionBySiteId.fromJson(Map<String, dynamic> json) => InspectionBySiteId(
    id: json["id"],
    name: json["name"],
    siteId: json["site_id"],
    status: json["status"],
    itemcount: json["itemcount"],
    userId: json["user_id"],
    dateTime: json["date_time"] == null ? null : DateTime.parse(json["date_time"]),
    userName: json["userName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "site_id": siteId,
    "status": status,
    "itemcount": itemcount,
    "user_id": userId,
    "date_time": dateTime?.toIso8601String(),
    "userName": userName,
  };
}