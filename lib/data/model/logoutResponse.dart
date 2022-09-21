import 'package:flutter/material.dart';


// To parse this JSON data, do
//
//     final logOutResponseModel = logOutResponseModelFromJson(jsonString);

import 'dart:convert';

LogOutResponseModel logOutResponseModelFromJson(String str) => LogOutResponseModel.fromJson(json.decode(str));

String logOutResponseModelToJson(LogOutResponseModel data) => json.encode(data.toJson());

class LogOutResponseModel {
  LogOutResponseModel({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  List<dynamic>? data;
  String? message;

  factory LogOutResponseModel.fromJson(Map<String, dynamic> json) => LogOutResponseModel(
    success: json["success"],
    data: List<dynamic>.from(json["data"].map((x) => x)),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data!.map((x) => x)),
    "message": message,
  };
}
