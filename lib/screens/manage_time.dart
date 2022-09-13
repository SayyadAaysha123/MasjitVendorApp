import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:masjit_vendor_app/data/model/masjid.dart';
import 'package:masjit_vendor_app/data/model/namaz_time.dart';
import 'package:masjit_vendor_app/utils/constant.dart';
import 'package:masjit_vendor_app/widget/edit_namz_time.dart';
import 'package:masjit_vendor_app/widget/edit_notice.dart';
import 'package:masjit_vendor_app/widget/eid_card.dart';
import 'package:masjit_vendor_app/widget/namaz_time_card.dart';
import 'package:http/http.dart' as http;

class ManageTime extends StatefulWidget {
  const ManageTime({Key? key}) : super(key: key);

  @override
  State<ManageTime> createState() => _ManageTimeState();
}

class _ManageTimeState extends State<ManageTime> {
  var _time = [
    WeeklyNamaz(day: 'FAJR', azan: '05:00 AM', jammat: '05:30 AM'),
    WeeklyNamaz(day: 'ZUHAR', azan: '01:00 AM', jammat: '01:30 AM'),
    WeeklyNamaz(day: 'ASR', azan: '05:00 AM', jammat: '05:30 AM'),
    WeeklyNamaz(day: 'MAGHRIB', azan: '06:30 AM', jammat: '06:35 AM'),
    WeeklyNamaz(day: 'ISHA', azan: '08:30 AM', jammat: '08:45 AM'),
    WeeklyNamaz(day: 'JUMA', azan: '01:45 AM', jammat: '02:30 AM'),
  ];

  late Box box;
  late Masjid masjid;

  @override
  void initState() {
    super.initState();

    box = Hive.box(kBoxName);
    var tokens = box.get(kToken, defaultValue: null);
    masjid = Masjid.fromJson(box.get(kMasjid));
    _time = masjid.weeklyNamaz ?? _time;
  }

  @override
  Widget build(BuildContext context) {


      _showBottomSheet() {
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


        }));
      }



    _show(int i) {
      Future<WeeklyNamaz?> newTime = showModalBottomSheet<WeeklyNamaz?>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          builder: (context) {
            return FractionallySizedBox(
              heightFactor: 0.7,
              child: EditNamazTime(time: _time[i]),
            );
          });

      newTime.then((value) {
        if (value != null) {
          setState(() {
            _time[i] = value;

          });

          updateMasjid().then((value) {
            box.delete(kMasjid);
            masjid.weeklyNamaz = _time;
            box.put(kMasjid, masjid.toJson());
          });
        }
      });
    }

    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      physics: const BouncingScrollPhysics(),
      children: [
        for (int i = 0; i < _time.length; i++)
          GestureDetector(
            onTap: () {
              _show(i);
            },
            child: NamazTimeCard(time: _time[i]),
          ),
        GestureDetector(
          onTap: () {

          },
          child: Card(
            margin: const EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
                child: Container(
                  color: Colors.green.shade900,
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "JUMMA",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("AZAN"),
                      Spacer(),
                      Text(
                        "5:00",
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("JAMAAt"),
                    IconButton(
                      icon: const Icon(
                        Icons.add_circle,
                        size: 20,
                      ),
                      onPressed: () {
                        _showBottomSheet();
                      },
                    ),
                    Spacer(),
                    Text(
                      "7:00",
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
            ])
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
        'weekly_namaz': _time,
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
