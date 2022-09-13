// To parse this JSON data, do
//
//     final registerResponseModel = registerResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:masjit_vendor_app/data/model/masjid.dart';

RegisterResponseModel registerResponseModelFromJson(String str) => RegisterResponseModel.fromJson(json.decode(str));

String registerResponseModelToJson(RegisterResponseModel data) => json.encode(data.toJson());

class RegisterResponseModel {
  RegisterResponseModel({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Data? data;
  String? message;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => RegisterResponseModel(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    this.email,
    this.phone,
    this.name,
    this.role,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.token,
    this.masjid,
  });

  String? email;
  String? phone;
  String? name;
  String? role;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  String? token;
  Masjid? masjid;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    email: json["email"],
    phone: json["phone"],
    name: json["name"],
    role: json["role"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
    token: json["token"],
    masjid: Masjid.fromJson(json["masjid"]),
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "phone": phone,
    "name": name,
    "role": role,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
    "token": token,
    "masjid": masjid?.toJson(),
  };
}

/*class Masjid {
  Masjid({
    this.masjidName,
    this.lat,
    this.long,
    this.street,
    this.subLocality,
    this.locality,
    this.postalCode,
    this.administrativeArea,
    this.country,
    this.userId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? masjidName;
  String? lat;
  String? long;
  String? street;
  String? subLocality;
  String? locality;
  String? postalCode;
  String? administrativeArea;
  String? country;
  int? userId;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory Masjid.fromJson(Map<String, dynamic> json) => Masjid(
    masjidName: json["masjid_name"],
    lat: json["lat"],
    long: json["long"],
    street: json["street"],
    subLocality: json["sub_locality"],
    locality: json["locality"],
    postalCode: json["postal_code"],
    administrativeArea: json["administrative_area"],
    country: json["country"],
    userId: json["user_id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "masjid_name": masjidName,
    "lat": lat,
    "long": long,
    "street": street,
    "sub_locality": subLocality,
    "locality": locality,
    "postal_code": postalCode,
    "administrative_area": administrativeArea,
    "country": country,
    "user_id": userId,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
  };
}*/
