import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:masjit_vendor_app/screens/on_boarding.dart';

main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.green.shade900,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green.shade900,
          primary: Colors.green.shade900,
        ),
      ),
      home: const OnBoarding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
