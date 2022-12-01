// To parse this JSON data, do
//
//     final updateMasjidProfileResponseModel = updateMasjidProfileResponseModelFromJson(jsonString);

import 'dart:convert';

UpdateMasjidProfileResponseModel updateMasjidProfileResponseModelFromJson(String str) => UpdateMasjidProfileResponseModel.fromJson(json.decode(str));

String updateMasjidProfileResponseModelToJson(UpdateMasjidProfileResponseModel data) => json.encode(data.toJson());

class UpdateMasjidProfileResponseModel {
  UpdateMasjidProfileResponseModel({
    this.message,
  });

  String? message;

  factory UpdateMasjidProfileResponseModel.fromJson(Map<String, dynamic> json) => UpdateMasjidProfileResponseModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
