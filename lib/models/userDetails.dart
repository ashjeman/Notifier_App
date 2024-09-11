import 'dart:convert';

UserDetails userDetailsFromJson(String str) => UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {

  int? id;
  String? uName;
  String? uEmailAddress;
  String? uMobileNumber;
  String? authCode;

  UserDetails({
    this.id,
    this.uName,
    this.uEmailAddress,
    this.uMobileNumber,
    this.authCode,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    id: json["id"],
    uName: json["u_Name"],
    uEmailAddress: json["u_Email_Address"],
    uMobileNumber: json["u_Mobile_Number"],
    authCode: json["authCode"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "u_Name": uName,
    "u_Email_Address": uEmailAddress,
    "u_Mobile_Number": uMobileNumber,
    "authCode": authCode,
  };
}