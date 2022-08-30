import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/screens/on_boarding.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const OnBoarding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
