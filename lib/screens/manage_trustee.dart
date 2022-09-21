import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:masjit_vendor_app/data/model/SharePreferenceClass.dart';
import 'package:masjit_vendor_app/data/model/masjid.dart';
import 'package:masjit_vendor_app/screens/home.dart';
import 'package:masjit_vendor_app/utils/constant.dart';
import 'package:masjit_vendor_app/widget/edit_trustee.dart';
import 'package:masjit_vendor_app/widget/trustee_card.dart';
import 'package:http/http.dart' as http;
import '../data/model/trustee.dart';




var trustee = [
  Trustee(designation: 'Chairman', name: 'Feroz', contact: '9168682309')
];

class ManageTrustee extends StatefulWidget {
  const ManageTrustee({Key? key}) : super(key: key);

  @override
  State<ManageTrustee>   createState() => _ManageTrusteeState();
}

class _ManageTrusteeState extends State<ManageTrustee> {



  Masjid? masjid1;
  String? token;
  String? masjidId;



  @override
  void initState() {
    super.initState();

    AppPreferences.getMasjid().then((value) {
      if (value == null) return;
      masjid1 = value;
    });
    AppPreferences.getToken().then((value) {
      token = value;
    });
    AppPreferences.getIds().then((value) {
      masjidId = value;
    });

    trustee = masjid1?.trustee ?? trustee;
  }

  @override
  Widget build(BuildContext context) {
    _show(int i) {
      final result = showModalBottomSheet<Trustee?>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          builder: (context) {
            return EditTrustee(trustee: trustee[i]);
          });

      result.then((value) {
        if (value != null) {
          setState(() {
            trustee[i] = value;
          });
        }

        updateMasjid(trustee).then((value) {
          AppPreferences.setMasjid(json.encode(value));
        });

      });
    }

    return trustee.isNotEmpty
        ? ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            physics: const BouncingScrollPhysics(),
            children: [
              for (int i = 0; i < trustee.length; i++)
                GestureDetector(
                  onTap: () {
                    _show(i);
                  },
                  child: TrusteeCard(trustee: trustee[i]),
                ),
            ],
          )
        : const Center(
            child: Text("add trustee"),
          );
  }

}

Future<Masjid> updateMasjid(List<Trustee> trustee) async {

  String? token = await AppPreferences.getToken();
  String? id = await AppPreferences.getIds();
  print("idddddd $id");


  final http.Response response = await http.put(
    Uri.parse("http://masjid.exportica.in/api/masjids/$id"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    },
    body: jsonEncode(<String, dynamic>{
      'trustee': trustee,
    }),
  );

  if (response.statusCode == 200) {
    print(response.body);
    return Masjid.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to update album.');
  }
}