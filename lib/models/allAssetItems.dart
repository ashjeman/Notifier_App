import 'dart:convert';

List<AllAssetItems> allAssetItemsFromJson(String str) => List<AllAssetItems>.from(json.decode(str).map((x) => AllAssetItems.fromJson(x)));

String allAssetItemsToJson(List<AllAssetItems> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllAssetItems {
  int id;
  int? userId;
  DateTime? timestamp;
  String? message;
  EscalationState? escalationState;
  String? transactionId;
  DateTime? submissionDateTime;
  int? siteId;
  int? alarmGroupId;
  AlarmGroupName? alarmGroupName;
  String? url;
  int? closedby;
  dynamic closedbyusername;
  int? status;
  dynamic image;
  bool? isRead;

  AllAssetItems({
    required this.id,
    this.userId,
    this.timestamp,
    this.message,
    this.escalationState,
    this.transactionId,
    this.submissionDateTime,
    this.siteId,
    this.alarmGroupId,
    this.alarmGroupName,
    this.url,
    this.closedby,
    this.closedbyusername,
    this.status,
    this.image,
    this.isRead,
  });

  factory AllAssetItems.fromJson(Map<String, dynamic> json) => AllAssetItems(
    id: json["id"],
    userId: json["user_id"],
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
    message: json["message"],
    escalationState: escalationStateValues.map[json["escalation_state"]]!,
    transactionId: json["transaction_id"],
    submissionDateTime: json["submission_date_time"] == null ? null : DateTime.parse(json["submission_date_time"]),
    siteId: json["site_id"],
    alarmGroupId: json["alarm_group_id"],
    alarmGroupName: alarmGroupNameValues.map[json["alarm_group_name"]]!,
    url: json["url"],
    closedby: json["closedby"],
    closedbyusername: json["closedbyusername"],
    status: json["status"],
    image: json["image"],
    isRead: json["isRead"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "timestamp": timestamp?.toIso8601String(),
    "message": message,
    "escalation_state": escalationStateValues.reverse[escalationState],
    "transaction_id": transactionId,
    "submission_date_time": submissionDateTime?.toIso8601String(),
    "site_id": siteId,
    "alarm_group_id": alarmGroupId,
    "alarm_group_name": alarmGroupNameValues.reverse[alarmGroupName],
    "url": url,
    "closedby": closedby,
    "closedbyusername": closedbyusername,
    "status": status,
    "image": image,
    "isRead": isRead,
  };
}

enum AlarmGroupName {
  CCTV,
  VIRTUAL_GUARD
}

final alarmGroupNameValues = EnumValues({
  "CCTV": AlarmGroupName.CCTV,
  "VIRTUAL GUARD": AlarmGroupName.VIRTUAL_GUARD
});

enum EscalationState {
  CLOSED,
  PENDING
}

final escalationStateValues = EnumValues({
  "CLOSED    ": EscalationState.CLOSED,
  "PENDING   ": EscalationState.PENDING
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}