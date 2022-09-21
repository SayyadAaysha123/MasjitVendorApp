

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:masjit_vendor_app/data/model/SharePreferenceClass.dart';
import 'package:masjit_vendor_app/data/model/loginResponse.dart';
import 'package:masjit_vendor_app/data/model/masjid.dart';
import 'package:masjit_vendor_app/screens/home.dart';
import 'package:masjit_vendor_app/screens/registration.dart';
import 'package:masjit_vendor_app/utils/constant.dart';
import 'package:http/http.dart' as http;


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final fields = <String, dynamic>{};

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  Masjid? masjid1;
  String? token;
  String? masjidId;

  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [getEmailField(), getPasswordField(), getLoginButton(), getBottomText()],
      ),
    );
  }



  Widget getEmailField() {
    return Padding(
      padding: const EdgeInsets.only(top: 100, left: 15, right: 15),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          label: Text('Email Id'),
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          fields['email'] = value;
        },
      ),
    );
  }

  Widget getPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
      child: TextFormField(
        controller: passwordController,
        obscureText: true,
        decoration: const InputDecoration(
          label: Text('Password'),
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          fields['password'] = value;
        },
      ),
    );
  }

  Widget getLoginButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
      child: ElevatedButton(
        onPressed: () async {
          var result = loginMasjid();

          result.then((value) {

            var box = Hive.box("testBox");
            box.delete(kToken);
            box.put(kToken, value?.data?.token);
            box.delete(kMasjid);
            box.put(kMasjid, value?.data?.masjid?.toJson());

            print(" registrationToken ${box.get("token")}");

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Home()));

          });
        },
        child: const Text(
          'Login',
        ),
      ),
    );
  }

  Widget getBottomText(){
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("New Masjid Login?", style: TextStyle(
            fontSize: 15,
          ),),

          GestureDetector(
            onDoubleTap: (){},
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Registration()));
            },
            child: Container(
              color: Colors.transparent,
              child: const Text(" Register", style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.green
              ),),
            ),
          ),
        ],
      ),
    );
  }



  Future<LogInResponseModel?> loginMasjid() async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse("http://masjid.exportica.in/api/masjid/login"));

      request.fields.addAll({
        "email": emailController.text.trim(),
        "password": passwordController.text.trim()

      });

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        var jsonData = json.decode(value);

        print("jsonData    ${jsonData["data"]}");

        var masjid = jsonData["data"]["masjid"];

        print("masjid    $masjid");

        var token = jsonData["data"]["token"];

        print("token    $token");

        var namaj = jsonData["data"]["masjid"]["weekly_namaz"];

        print("namaj    $namaj");

        AppPreferences.setToken(jsonData["data"]["token"]);

        AppPreferences.setMasjid(json.encode(jsonData["data"]["masjid"]));

        AppPreferences.setIds(json.encode(jsonData["data"]["masjid"]["id"]));

        final masjid1 = await AppPreferences.getMasjid();

        print("Idddddd ${json.encode(jsonData["data"]["masjid"]["id"])}");

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Home()));
      });
    } catch (e) {
      print(e);
    }
  }

/* Future<LogInResponseModel> loginMasjid() async {
    try {
      final result = await http.post(
          Uri.parse("http://masjid.exportica.in/api/masjid/login"),
          body: {
            "email": emailController.text.trim(),
            "password": passwordController.text.trim()
          });

      if (result.statusCode == 200) {
        print("Hii ${result.body}");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home()));
      }

      return registerResponseModelFromJson(result.body);
    } catch (e) {
      throw e;
    }
  }*/
}
