import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:masjit_vendor_app/data/model/SharePreferenceClass.dart';
import 'package:masjit_vendor_app/screens/home.dart';
import 'package:masjit_vendor_app/screens/login.dart';
import 'package:masjit_vendor_app/screens/on_boarding.dart';
import 'package:masjit_vendor_app/screens/registration.dart';

import 'utils/constant.dart';

String? accessToken;
bool? firstRun;
void main() async{

  await Hive.initFlutter();

  var box = await Hive.openBox(kBoxName);

  accessToken = await AppPreferences.getToken();
   firstRun = await AppPreferences.setIsFirstTime();

  print("is_first---> $firstRun");
  print("Heyyyy ${AppPreferences.getToken()}");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    Widget destination = Registration();


    if (accessToken == "") {
        destination = Registration();
    }else{
      destination = Home();
    }

    if(firstRun == true){

      destination = LoginScreen();

    }else{
      // firstRun = await AppPreferences.setIsFirstTime();
      destination = OnBoarding();


    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.green.shade900,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green.shade900,
          primary: Colors.green.shade900,
        ),
      ),
        // box.get(kIsOnBoardingDone, defaultValue: false) ?
      home: Registration(),
      debugShowCheckedModeBanner: false,
    );
  }
}
