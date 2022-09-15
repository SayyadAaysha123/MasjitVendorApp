// To parse this JSON data, do
//
//     final getAllNoticesResponseModel = getAllNoticesResponseModelFromJson(jsonString);

import 'dart:convert';

GetAllNoticesResponseModel getAllNoticesResponseModelFromJson(String str) => GetAllNoticesResponseModel.fromJson(json.decode(str));

String getAllNoticesResponseModelToJson(GetAllNoticesResponseModel data) => json.encode(data.toJson());

class GetAllNoticesResponseModel {
  GetAllNoticesResponseModel({
    this.data,
  });

  List<String>? data;

  factory GetAllNoticesResponseModel.fromJson(Map<String, dynamic> json) => GetAllNoticesResponseModel(
    data: List<String>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x)),
  };
}
