import 'dart:convert';

List<AllSite> allSiteFromJson(String str) => List<AllSite>.from(json.decode(str).map((x) => AllSite.fromJson(x)));

String allSiteToJson(List<AllSite> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllSite {
  int id;
  String? siteName;
  String? siteCode;
  int? countryId;

  AllSite({
    required this.id,
    this.siteName,
    this.siteCode,
    this.countryId,
  });

  factory AllSite.fromJson(Map<String, dynamic> json) => AllSite(
    id: json["id"],
    siteName: json["site_name"],
    siteCode: json["site_code"],
    countryId: json["country_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "site_name": siteName,
    "site_code": siteCode,
    "country_id": countryId,
  };
}