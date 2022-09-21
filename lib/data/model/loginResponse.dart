import 'package:flutter/material.dart';



import 'package:masjit_vendor_app/data/model/masjid.dart';


import 'dart:convert';

LogInResponseModel logInResponseModelFromJson(String str) => LogInResponseModel.fromJson(json.decode(str));

String logInResponseModelToJson(LogInResponseModel data) => json.encode(data.toJson());

class LogInResponseModel {
  LogInResponseModel({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Data? data;
  String? message;

  factory LogInResponseModel.fromJson(Map<String, dynamic> json) => LogInResponseModel(
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
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.role,
    this.phone,
    this.area,
    this.city,
    this.state,
    this.country,
    this.token,
    this.masjid,
  });

  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? role;
  String? phone;
  dynamic area;
  dynamic city;
  dynamic state;
  dynamic country;
  String? token;
  Masjid? masjid;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    role: json["role"],
    phone: json["phone"],
    area: json["area"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    token: json["token"],
    masjid: Masjid.fromJson(json["masjid"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "role": role,
    "phone": phone,
    "area": area,
    "city": city,
    "state": state,
    "country": country,
    "token": token,
    "masjid": masjid?.toJson(),
  };
}



/*

class Masjid {
  Masjid({
    this.id,
    this.weeklyNamaz,
    this.trustee,
    this.eid,
    this.images,
    this.sahr,
    this.iftar,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.masjidName,
    this.street,
    this.subLocality,
    this.locality,
    this.postalCode,
    this.administrativeArea,
    this.country,
    this.lat,
    this.long,
    this.jumma,
  });

  int? id;
  List<WeeklyNamaz>? weeklyNamaz;
  List<dynamic>? trustee;
  List<Eid> eid;
  List<String> images;
  dynamic sahr;
  dynamic iftar;
  DateTime createdAt;
  DateTime updatedAt;
  int userId;
  String masjidName;
  String street;
  String subLocality;
  String locality;
  String postalCode;
  String administrativeArea;
  String country;
  String lat;
  String long;
  Jumma jumma;

  factory Masjid.fromJson(Map<String, dynamic> json) => Masjid(
    id: json["id"],
    weeklyNamaz: List<WeeklyNamaz>.from(json["weekly_namaz"].map((x) => WeeklyNamaz.fromJson(x))),
    trustee: List<dynamic>.from(json["trustee"].map((x) => x)),
    eid: List<Eid>.from(json["eid"].map((x) => Eid.fromJson(x))),
    images: List<String>.from(json["images"].map((x) => x)),
    sahr: json["sahr"],
    iftar: json["iftar"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    userId: json["user_id"],
    masjidName: json["masjid_name"],
    street: json["street"],
    subLocality: json["sub_locality"],
    locality: json["locality"],
    postalCode: json["postal_code"],
    administrativeArea: json["administrative_area"],
    country: json["country"],
    lat: json["lat"],
    long: json["long"],
    jumma: Jumma.fromJson(json["jumma"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "weekly_namaz": List<dynamic>.from(weeklyNamaz.map((x) => x.toJson())),
    "trustee": List<dynamic>.from(trustee.map((x) => x)),
    "eid": List<dynamic>.from(eid.map((x) => x.toJson())),
    "images": List<dynamic>.from(images.map((x) => x)),
    "sahr": sahr,
    "iftar": iftar,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "user_id": userId,
    "masjid_name": masjidName,
    "street": street,
    "sub_locality": subLocality,
    "locality": locality,
    "postal_code": postalCode,
    "administrative_area": administrativeArea,
    "country": country,
    "lat": lat,
    "long": long,
    "jumma": jumma.toJson(),
  };
}

class Eid {
  Eid({
    this.azan,
    this.name,
    this.jammat,
  });

  String azan;
  String name;
  List<String> jammat;

  factory Eid.fromJson(Map<String, dynamic> json) => Eid(
    azan: json["azan"],
    name: json["name"],
    jammat: List<String>.from(json["jammat"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "azan": azan,
    "name": name,
    "jammat": List<dynamic>.from(jammat.map((x) => x)),
  };
}

class Jumma {
  Jumma({
    this.azan,
    this.jammat,
  });

  String azan;
  List<String> jammat;

  factory Jumma.fromJson(Map<String, dynamic> json) => Jumma(
    azan: json["azan"],
    jammat: List<String>.from(json["jammat"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "azan": azan,
    "jammat": List<dynamic>.from(jammat.map((x) => x)),
  };
}

class WeeklyNamaz {
  WeeklyNamaz({
    this.day,
    this.azan,
    this.jammat,
  });

  String day;
  String azan;
  String jammat;

  factory WeeklyNamaz.fromJson(Map<String, dynamic> json) => WeeklyNamaz(
    day: json["day"],
    azan: json["azan"],
    jammat: json["jammat"],
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "azan": azan,
    "jammat": jammat,
  };
}
*/
