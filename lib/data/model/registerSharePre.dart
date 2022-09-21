

import 'dart:convert';

import 'package:masjit_vendor_app/data/model/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterData{

  Future saveJsonData(jsonData) async {

    final pref = await SharedPreferences.getInstance();

    var saveData = jsonEncode(jsonData);

    await pref.setString('jsonData', saveData);

  }

  Future<void> getJsonData() async{
    final prefs = await SharedPreferences.getInstance();
    var temp = prefs.getString('jsonData')??"Hii";
    print('Data $temp');
    var data = RegisterResponseModel.fromJson(jsonDecode(temp.toString()));
    print("token ${data.data?.token}");
    print("masjid ${data.data?.masjid}");
  }


}