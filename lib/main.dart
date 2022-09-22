import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/data/model/SharePreferenceClass.dart';
import 'package:masjit_vendor_app/data/model/masjid.dart';
import 'package:masjit_vendor_app/screens/home.dart';
import 'package:masjit_vendor_app/screens/on_boarding.dart';
import 'package:masjit_vendor_app/screens/registration.dart';


void main() async{

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


 /* Masjid? masjid1;
  String? token;
  String? masjidId;
  Widget? destination;*/

  @override
  void initState() {
    super.initState();

   /* AppPreferences.getMasjid().then((value) {
      if (value == null) return;
      masjid1 = value;
    });
    AppPreferences.getToken().then((value) {
      token = value;
    });
    AppPreferences.getIds().then((value) {
      masjidId = value;
    });
*/

  }


  @override
  Widget build(BuildContext context) {

   /* if (token == null) {
      destination = const Registration();
    } else {
      destination = const Home();
    }*/

    // if (firstRun == true) {
    //   destination = LoginScreen();
    // } else {
    //   // firstRun = await AppPreferences.setIsFirstTime();
    //   destination = OnBoarding();
    // }

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
      home:  MyHomePage(),
      debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/onBoardingScreen': (BuildContext context) => OnBoarding(),
          '/registrationScreen': (BuildContext context) => Registration(),
          '/homeScreen': (BuildContext context) => Home(),
        }
    );
  }

}



class MyHomePage extends StatefulWidget {



  @override
  _MyHomePageState createState() => _MyHomePageState();

}


class _MyHomePageState extends State<MyHomePage> {



  @override
  void initState() {
    super.initState();

    startTimer();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: splash(),
      ),
    );
  }

  Widget splash() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
    );
  }

  void navigateSignUpParentPage() {
    Navigator.of(context).pushReplacementNamed('/registrationScreen');
  }

  void navigateDashboardScreenPage() {
    Navigator.of(context).pushReplacementNamed('/homeScreen');
  }

  void navigateOnBoardScreenPage() {
    Navigator.of(context).pushReplacementNamed('/onBoardingScreen');
  }


  startTimer() async {
    var duration =  Duration(milliseconds: Platform.isIOS ? 1000 : 1000);
    try {

      String? accessToken = await AppPreferences.getToken();
      Masjid? masjid1 = await AppPreferences.getMasjid();


      if (accessToken == "" && masjid1 == null) {
        return Timer(duration, navigateSignUpParentPage);
      }

      else if (accessToken != "" && masjid1 != null) {
        return Timer(duration, navigateDashboardScreenPage);
      }

    } catch (e) {
      print("eeeeee    $e");
    }

    return Timer(duration, navigateOnBoardScreenPage);
  }

}
