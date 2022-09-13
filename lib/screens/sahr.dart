import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:masjit_vendor_app/data/model/masjid.dart';
import 'package:masjit_vendor_app/utils/constant.dart';
import 'package:http/http.dart' as http;

class Sahr extends StatefulWidget {
  const Sahr({Key? key}) : super(key: key);

  @override
  State<Sahr> createState() => _SahrState();
}

class _SahrState extends State<Sahr> {
  String _sahr = '5:30 AM';
  String _iftar = '5:30 AM';

  late Box box;
  late Masjid masjid;

  @override
  void initState() {
    super.initState();

    box = Hive.box(kBoxName);
    var tokens = box.get(kToken, defaultValue: null);
    masjid = Masjid.fromJson(box.get(kMasjid));

  }


  @override
  Widget build(BuildContext context) {
    TextStyle? _textStyle = Theme.of(context).textTheme.subtitle2;

    _showBottomSheet(int i, String time) {
      Future<String?> result = showModalBottomSheet<String>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          builder: (context) {
            String? _time;
            return Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: DateFormat('jm').parse(time),
                  onDateTimeChanged: (DateTime newTime) {
                    _time = DateFormat.jm().format(newTime);
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(_time);
                },
                child: const Text('save'),
              )
            ]);
          });

      result.then((value) => setState(() {
            if (value == null) return;

            if (i == 0) {
              _sahr = value;
              masjid.sahr = _sahr;
            } else {
              _iftar = value;
              masjid.iftar = _iftar;
            }

            updateMasjid().then((value) {
              box.delete(kMasjid);
              box.put(kMasjid, masjid.toJson());
            });


          }));
    }

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            _showBottomSheet(0, _sahr);
            print("Heyy");
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SAHR',
                      style: _textStyle,
                    ),
                    Text(_sahr),
                  ]),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            print("Hii");
            _showBottomSheet(1, _iftar);
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'IFTAR',
                      style: _textStyle,
                    ),
                    Text(_iftar),
                  ]),
            ),
          ),
        )
      ],
    );
  }

  Future<Masjid> updateMasjid() async {
    final http.Response response = await http.put(
      Uri.parse("http://masjid.exportica.in/api/masjids/3"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${box.get(kToken)}'
      },
      body: jsonEncode(<String, dynamic>{
        'sahr': _sahr,
        'iftar' : _iftar
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
