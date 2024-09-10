import 'dart:convert';

ManualAlarm manualAlarmFromJson(String str) => ManualAlarm.fromJson(json.decode(str));
String manualAlarmToJson(ManualAlarm data) => json.encode(data.toJson());

class ManualAlarm{
  int userId;
  DateTime? timeStamp;
  String message;
  DateTime submissionDate;
  int siteId;
  int alarmGroupId;
  String escalationState;

  ManualAlarm({
    required this.userId,
    required this.timeStamp,
    required this.message,
    required this.submissionDate,
    required this.siteId,
    required this.alarmGroupId,
    required this.escalationState,
  });

  factory ManualAlarm.fromJson(Map<String, dynamic> json) => ManualAlarm(
      userId: json["user_id"],
      message: json["message"],
      submissionDate: json["submission_date_time"],
      siteId: json["site_id"],
      alarmGroupId: json["alarm_group_id"],
      escalationState: json["escalation_state"],
      timeStamp: json["timestamp"]
  );

  Map<String,dynamic> toJson() => {
    "user_id": userId,
    "message": message,
    "submission_date_time": submissionDate,
    "site_id": siteId,
    "alarm_group_id": alarmGroupId,
    "timestamp": timeStamp,
    "escalation_state": escalationState
  };
}