import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:masjit_vendor_app/data/model/SharePreferenceClass.dart';
import 'package:masjit_vendor_app/data/model/eid.dart';
import 'package:masjit_vendor_app/data/model/masjid.dart';
import 'package:masjit_vendor_app/widget/eid_card.dart';

var eid = [
  Eid(name: 'EID AL - FITR', jammat: [
    '08:30 AM',
    '09:30 AM',
  ]),
  Eid(name: 'EID AL - ADHA', jammat: [
    '07:30 AM',
    '08:30 AM',
  ]),
];

class ManageEid extends StatefulWidget {
  const ManageEid({Key? key}) : super(key: key);

  @override
  State<ManageEid> createState() => _ManageEidState();
}

class _ManageEidState extends State<ManageEid> {

  final _nameEditController = TextEditingController();
  int _selected = 0;

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

  }


  @override
  Widget build(BuildContext context) {

    _show(int i) {
      _selected = i;
      Future<String?> result = showModalBottomSheet<String>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          builder: (context) {
            String? _time;

            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Column(mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .2,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.time,
                        onDateTimeChanged: (DateTime newTime) {
                          _time = DateFormat.jm().format(newTime);
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(_time ?? DateFormat.jm().format(DateTime.now()));
                      },
                      child: const Text('save'),
                    )
                  ]),
            );
          });

      result.then((value) {
        if (value != null) {
          setState(() {
            eid[_selected].jammat?.add(value);
            updateMasjid().then((value) {
              AppPreferences.setMasjid(json.encode(value));
            });
          });
        }
      });
    }


    return eid.isNotEmpty
        ? ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      physics: const BouncingScrollPhysics(),
      children: [
        for (int i = 0; i < eid.length; i++)
          GestureDetector(
            onTap: () {
              _show(i);
            },
            child: EidCard(eid: eid[i]),
          ),
      ],
    )
        : const Center(
      child: Text("add trustee"),
    );
  }

  Future<Masjid> updateMasjid() async {

    final http.Response response = await http.put(
      Uri.parse("http://masjid.exportica.in/api/masjids/$masjidId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}'
      },
      body: jsonEncode(<String, dynamic>{
        'eid': eid
      }),
    );

    if (response.statusCode == 200) {
      print(response.body);
      return Masjid.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update album.');
    }
  }

}
