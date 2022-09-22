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
    return prefs.getString("token");
  }

  static setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  static Future<String?> getIds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("id");
  }

  static setIds(String idss) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("id", idss);
  }

  static Future<Masjid?> getMasjid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final masjid = Masjid.fromJson(json.decode(prefs.getString("masjid")!));
    print('get masjid -> $masjid');
    return masjid;
  }

  static setMasjid(String masjid) async {
    print('set masjid -> $masjid');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("masjid", masjid);
  }

  static Future<bool?> getIsFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("is_first");
  }

  static Future<bool?> setIsFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("IsFirstTime--> ${prefs.setBool("is_first", false)}");
    return prefs.setBool("is_first", false);
  }

  static clearAppPreference() async {
    prefs = await getInstance();
    prefs?.clear();
  }
}
