import 'dart:convert';

import 'package:masjit_vendor_app/data/model/masjid.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static SharedPreferences? prefs;

  static Future<SharedPreferences> getInstance() async {
    return await SharedPreferences.getInstance();
  }




  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("HiiiiiShare ${prefs.getString("token")}");
    return prefs.getString("token");
  }

  static setToken(String token) async {
    SharedPreferences  prefs = await SharedPreferences.getInstance();
    print("deviceId   $token");
    prefs.setString("token", token);
  }


  static Future<String?> getIds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Masjidddddd ${prefs.getString("id")}");
    return prefs.getString("id");
  }

  static setIds(String idss) async {
    SharedPreferences  prefs = await SharedPreferences.getInstance();
    print("Masjidddd   $idss");
    prefs.setString("id", idss);
  }


  static Future<Masjid?> getMasjid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Masjid.fromJson(json.decode(prefs.getString("masjid")!));
  }



  static setMasjid(String masjid) async {
    SharedPreferences  prefs = await SharedPreferences.getInstance();
    print("deviceId   $masjid");
    prefs.setString("masjid", masjid);
  }

  static Future<bool?> getIsFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("IsFirstTime---> ${prefs.getBool("is_first")}");
    return prefs.getBool("is_first");
  }

  static Future<bool?> setIsFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("IsFirstTime--> ${prefs.setBool("is_first",false)}");
    return prefs.setBool("is_first",false);
  }

}
