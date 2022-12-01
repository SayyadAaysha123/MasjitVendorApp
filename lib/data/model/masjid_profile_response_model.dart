// To parse this JSON data, do
//
//     final masjidProfileResponseModel = masjidProfileResponseModelFromJson(jsonString);

import 'dart:convert';

MasjidProfileResponseModel masjidProfileResponseModelFromJson(String str) => MasjidProfileResponseModel.fromJson(json.decode(str));

String masjidProfileResponseModelToJson(MasjidProfileResponseModel data) => json.encode(data.toJson());

class MasjidProfileResponseModel {
  MasjidProfileResponseModel({
    this.data,
  });

  Data? data;

  factory MasjidProfileResponseModel.fromJson(Map<String, dynamic> json) => MasjidProfileResponseModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.userId,
    this.masjidName,
    this.weeklyNamaz,
    this.eid,
    this.images,
    this.trustee,
    this.jumma,
    this.sahr,
    this.iftar,
    this.street,
    this.subLocality,
    this.locality,
    this.postalCode,
    this.administrativeArea,
    this.country,
    this.lat,
    this.long,
    this.createdAt,
    this.updatedAt,
    this.immam,
  });

  int? id;
  String? userId;
  String? masjidName;
  List<WeeklyNamaz>? weeklyNamaz;
  List<Eid>? eid;
  List<String>? images;
  List<dynamic>? trustee;
  Jumma? jumma;
  String? sahr;
  String? iftar;
  String? street;
  String? subLocality;
  String? locality;
  String? postalCode;
  String? administrativeArea;
  String? country;
  String? lat;
  String? long;
  DateTime? createdAt;
  DateTime? updatedAt;
  Immam? immam;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    userId: json["user_id"],
    masjidName: json["masjid_name"],
    weeklyNamaz: List<WeeklyNamaz>.from(json["weekly_namaz"].map((x) => WeeklyNamaz.fromJson(x))),
    eid: List<Eid>.from(json["eid"].map((x) => Eid.fromJson(x))),
    images: List<String>.from(json["images"].map((x) => x)),
    trustee: List<dynamic>.from(json["trustee"].map((x) => x)),
    jumma: Jumma.fromJson(json["jumma"]),
    sahr: json["sahr"],
    iftar: json["iftar"],
    street: json["street"],
    subLocality: json["sub_locality"],
    locality: json["locality"],
    postalCode: json["postal_code"],
    administrativeArea: json["administrative_area"],
    country: json["country"],
    lat: json["lat"],
    long: json["long"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    immam: Immam.fromJson(json["immam"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "masjid_name": masjidName,
    "weekly_namaz": List<dynamic>.from(weeklyNamaz!.map((x) => x.toJson())),
    "eid": List<dynamic>.from(eid!.map((x) => x.toJson())),
    "images": List<dynamic>.from(images!.map((x) => x)),
    "trustee": List<dynamic>.from(trustee!.map((x) => x)),
    "jumma": jumma?.toJson(),
    "sahr": sahr,
    "iftar": iftar,
    "street": street,
    "sub_locality": subLocality,
    "locality": locality,
    "postal_code": postalCode,
    "administrative_area": administrativeArea,
    "country": country,
    "lat": lat,
    "long": long,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "immam": immam?.toJson(),
  };
}

class Eid {
  Eid({
    this.name,
    this.jammat,
  });

  String? name;
  List<String>? jammat;

  factory Eid.fromJson(Map<String, dynamic> json) => Eid(
    name: json["name"],
    jammat: List<String>.from(json["jammat"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "jammat": List<dynamic>.from(jammat!.map((x) => x)),
  };
}

class Immam {
  Immam({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.role,
    this.phone,
    this.area,
    this.city,
    this.state,
    this.country,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? role;
  String? phone;
  dynamic area;
  dynamic city;
  dynamic state;
  dynamic country;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Immam.fromJson(Map<String, dynamic> json) => Immam(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    role: json["role"],
    phone: json["phone"],
    area: json["area"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "role": role,
    "phone": phone,
    "area": area,
    "city": city,
    "state": state,
    "country": country,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Jumma {
  Jumma({
    this.jammat,
  });

  List<String>? jammat;

  factory Jumma.fromJson(Map<String, dynamic> json) => Jumma(
    jammat: List<String>.from(json["jammat"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "jammat": List<dynamic>.from(jammat!.map((x) => x)),
  };
}

class WeeklyNamaz {
  WeeklyNamaz({
    this.day,
    this.azan,
    this.jammat,
  });

  String? day;
  String? azan;
  String? jammat;

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
