import 'dart:convert';

import 'package:masjit_vendor_app/data/model/eid.dart';
import 'package:masjit_vendor_app/data/model/jumma.dart';
import 'package:masjit_vendor_app/data/model/namaz_time.dart';
import 'package:masjit_vendor_app/data/model/place.dart';
import 'package:masjit_vendor_app/data/model/trustee.dart';


Masjid riderNewOrderFromJson(Map<String, dynamic> str) =>
    Masjid.fromJson(str);

String riderNewOrderToJson(Masjid data) => json.encode(data.toJson());

class Masjid {
  int? id;
  List<WeeklyNamaz>? weeklyNamaz;
  Jumma? jumma;
  List<Trustee>? trustee;
  List<Eid>? eid;
  List<String>? images;
  String? sahr;
  String? iftar;
  Place? place;


  @override
  String toString() {
    return 'Masjid{id: $id, weeklyNamaz: $weeklyNamaz, jumma: $jumma, trustee: $trustee, eid: $eid, images: $images, sahr: $sahr, iftar: $iftar, place: $place}';
  }

  Masjid(
      {this.id,
      this.weeklyNamaz,
      this.jumma,
      this.trustee,
      this.eid,
      this.images,
      this.sahr,
      this.iftar,
      this.place});

  Masjid.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['weekly_namaz'] != null) {
      weeklyNamaz = <WeeklyNamaz>[];
      json['weekly_namaz'].forEach((v) {
        weeklyNamaz!.add(WeeklyNamaz.fromJson(v));
      });
    }
    jumma = json['jumma'] != null ? Jumma.fromJson(json['jumma']) : null;
    if (json['trustee'] != null) {
      trustee = <Trustee>[];
      json['trustee'].forEach((v) {
        trustee!.add(Trustee.fromJson(v));
      });
    }
    if (json['eid'] != null) {
      eid = <Eid>[];
      json['eid'].forEach((v) {
        eid!.add(Eid.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <String>[];
      json['images'].forEach((v) {
        images!.add(v);
      });
    }
    sahr = json['sahr'];
    iftar = json['iftar'];
    place = json['place'] != null ? Place.fromJson(json['place']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (weeklyNamaz != null) {
      data['weekly_namaz'] = weeklyNamaz!.map((v) => v.toJson()).toList();
    }
    if (jumma != null) {
      data['jumma'] = jumma!.toJson();
    }
    if (trustee != null) {
      data['trustee'] = trustee!.map((v) => v.toJson()).toList();
    }
    if (eid != null) {
      data['eid'] = eid!.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v).toList();
    }
    data['sahr'] = sahr;
    data['iftar'] = iftar;
    if (place != null) {
      data['place'] = place!.toJson();
    }
    return data;
  }
}
