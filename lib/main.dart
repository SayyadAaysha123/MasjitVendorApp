import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:masjit_vendor_app/screens/home.dart';
import 'package:masjit_vendor_app/screens/on_boarding.dart';
import 'package:masjit_vendor_app/screens/registration.dart';

import 'utils/constant.dart';

void main() async{

  await Hive.initFlutter();

  var box = await Hive.openBox(kBoxName);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var  box = Hive.box(kBoxName);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.green.shade900,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green.shade900,
          primary: Colors.green.shade900,
        ),
      ),
      home: box.get(kIsOnBoardingDone, defaultValue: false) ? Registration() : OnBoarding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
