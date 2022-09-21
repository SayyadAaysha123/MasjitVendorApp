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

  List<String>? data;

  factory GetAllNotices.fromJson(Map<String, dynamic> json) => GetAllNotices(
    data: List<String>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x)),
  };
}
