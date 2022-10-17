// To parse this JSON data, do
//
//     final deleteNotices = deleteNoticesFromJson(jsonString);

import 'dart:convert';

DeleteNotices deleteNoticesFromJson(String str) => DeleteNotices.fromJson(json.decode(str));

String deleteNoticesToJson(DeleteNotices data) => json.encode(data.toJson());

class DeleteNotices {
  DeleteNotices({
    this.message,
  });

  String? message;

  factory DeleteNotices.fromJson(Map<String, dynamic> json) => DeleteNotices(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
