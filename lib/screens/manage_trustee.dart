import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
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



  late Box box;
  late Masjid masjid;

  @override
  void initState() {
    super.initState();

    box = Hive.box(kBoxName);
    var tokens = box.get(kToken, defaultValue: null);
    masjid = Masjid.fromJson(box.get(kMasjid));
    trustee = masjid.trustee ?? trustee;
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
          box.delete(kMasjid);
          masjid.trustee = trustee;
          box.put(kMasjid, masjid.toJson());
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

  var box = Hive.box(kBoxName);

  final http.Response response = await http.put(
    Uri.parse("http://masjid.exportica.in/api/masjids/${masjid.id}"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${box.get(kToken)}'
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