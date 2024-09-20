import 'dart:convert';

List<Messages> messageFromJson(String str) => List<Messages>.from(json.decode(str).map((x) => Messages.fromJson(x)));

String messageToJson(List<Messages> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Messages {
  int id;
  int alarmId;
  int userId;
  DateTime dateTime;
  String url;
  String msg;
  String username;
  int siteId;

  Messages({
    required this.id,
    required this.alarmId,
    required this.userId,
    required this.dateTime,
    required this.url,
    required this.msg,
    required this.username,
    required this.siteId,
  });

  factory Messages.fromJson(Map<String, dynamic> json) => Messages(
    id: json["id"],
    alarmId: json["alarm_id"],
    userId: json["user_id"],
    dateTime: DateTime.parse(json["date_time"]),
    url: json["url"],
    msg: json["msg"],
    username: json["username"],
    siteId: json["site_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "alarm_id": alarmId,
    "user_id": userId,
    "date_time": dateTime.toIso8601String(),
    "url": url,
    "msg": msg,
    "username": username,
    "site_id": siteId,
  };


  /*
  @override
  String toString() {
    return toJson().toString();
  }
   */

  @override
  String toString(){
    return '$id, $alarmId, $userId, $dateTime, $url, $msg, $username, $siteId';
  }

}