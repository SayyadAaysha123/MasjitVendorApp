// To parse this JSON data, do
//
//     final getAllNotices = getAllNoticesFromJson(jsonString);

import 'dart:convert';

GetAllNotices getAllNoticesFromJson(String str) => GetAllNotices.fromJson(json.decode(str));

String getAllNoticesToJson(GetAllNotices data) => json.encode(data.toJson());

class GetAllNotices {
  GetAllNotices({
    this.data,
  });

  List<Datum>? data;

  factory GetAllNotices.fromJson(Map<String, dynamic> json) => GetAllNotices(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.masjidId,
    this.notice,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? masjidId;
  String? notice;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    masjidId: json["masjid_id"],
    notice: json["notice"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "masjid_id": masjidId,
    "notice": notice,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
