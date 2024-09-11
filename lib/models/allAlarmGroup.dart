import 'dart:convert';

List<AllAlarmGroup> allAlarmGroupFromJson(String str) => List<AllAlarmGroup>.from(json.decode(str).map((x) => AllAlarmGroup.fromJson(x)));

String allAlarmGroupToJson(List<AllAlarmGroup> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllAlarmGroup {
  int id;
  String alarmGroupName;
  int siteId;

  AllAlarmGroup({
    required this.id,
    required this.alarmGroupName,
    required this.siteId,
  });

  factory AllAlarmGroup.fromJson(Map<String, dynamic> json) => AllAlarmGroup(
    id: json["id"],
    alarmGroupName: json["alarm_group_name"],
    siteId: json["site_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "alarm_group_name": alarmGroupName,
    "site_id": siteId,
  };
}
