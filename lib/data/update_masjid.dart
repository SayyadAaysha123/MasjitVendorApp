import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:masjit_vendor_app/data/model/SharePreferenceClass.dart';
import 'package:masjit_vendor_app/data/model/masjid.dart';

Future<Masjid> updateMasjid(Map<String, dynamic> fileds) async {
  var token = await AppPreferences.getToken();
  var masjidId = await AppPreferences.getIds();
  final http.Response response = await http.put(
    Uri.parse("http://admin.azan4salah.com/api/masjids/$masjidId"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${token}'
    },
    body: jsonEncode(fileds),
  );

  if (response.statusCode == 200) {
    print('update response -> ${response.body}');
    AppPreferences.setMasjidName(json.decode(response.body)['masjid']['masjid_name']);
    print("finallyy ${json.decode(response.body)['masjid']['masjid_name']}");
    return Masjid.fromJson(json.decode(response.body)['masjid']);
  } else {
    throw Exception('Failed to update album.');
  }
}