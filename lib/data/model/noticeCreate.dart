// To parse this JSON data, do
//
//     final noticesCreateResponseModel = noticesCreateResponseModelFromJson(jsonString);

import 'dart:convert';

NoticesCreateResponseModel noticesCreateResponseModelFromJson(String str) => NoticesCreateResponseModel.fromJson(json.decode(str));

String noticesCreateResponseModelToJson(NoticesCreateResponseModel data) => json.encode(data.toJson());

class NoticesCreateResponseModel {
  NoticesCreateResponseModel({
    this.message,
  });

  String? message;

  factory NoticesCreateResponseModel.fromJson(Map<String, dynamic> json) => NoticesCreateResponseModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
