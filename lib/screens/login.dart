import 'package:flutter/material.dart';




class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // getMasjidImageLayout()
        ],
      ),
    );
  }


  Widget getMasjidImageLayout(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 250,
          child: Image(image: AssetImage("assets/images/masjidImage.png"),),
        ),
      ],
    );
  }
}
