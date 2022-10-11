import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:masjit_vendor_app/data/model/SharePreferenceClass.dart';
import 'package:masjit_vendor_app/data/model/jumma.dart';
import 'package:masjit_vendor_app/data/model/masjid.dart';
import 'package:masjit_vendor_app/data/model/namaz_time.dart';
import 'package:masjit_vendor_app/data/update_masjid.dart';
import 'package:masjit_vendor_app/widget/edit_namz_time.dart';

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

  // var eid = Jumma(azan: '5:00 PM', jammat: [
  //   '08:30 AM',
  //   '09:30 AM',
  // ]);

  var jumma = Jumma(azan: '5:00 PM', jammat: [
    '08:30 AM',
    '09:30 AM',
  ]);


  @override
  Widget build(BuildContext context) {
    /*_showBottomSheet() {
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
            eid.jammat?.add(value);
            updateMasjid({'weekly_namaz': _time, 'jumma': eid})
                .then((value) {});
          }));
    }*/

    TextStyle? _textStyle = Theme.of(context).textTheme.bodyLarge;


    _showJamat() {
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
              child: Column(mainAxisSize: MainAxisSize.min, children: [
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
                    Navigator.of(context)
                        .pop(_time ?? DateFormat.jm().format(DateTime.now()));
                  },
                  child: const Text('save'),
                )
              ]),
            );
          });

      result.then((value) {
        if (value != null) {
          setState(() {
            jumma.jammat?.add(value);
            updateMasjid({'jumma': jumma}).then((value) {
              AppPreferences.setMasjid(json.encode(value));
              setState(() {

              });
            });
          });
        }
      });
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
       /* if (value != null) {
          setState(() {
            _time[i] = value;
          });

          updateMasjid({'weekly_namaz': _time})
              .then((value) async {
            await AppPreferences.setMasjid(json.encode(value));
          });
        }*/


        setState(() {
          _time[i] = value!;
          updateMasjid({'weekly_namaz': _time}).then((value) {
            AppPreferences.setMasjid(json.encode(value));
            setState(() {

            });
          });
        });

      });
    }

    return FutureBuilder<Masjid?>(
        future: AppPreferences.getMasjid(),
        builder: (context, snapshot) {
          _time = snapshot.data?.weeklyNamaz ?? _time;
          jumma = snapshot.data?.jumma ?? jumma;
          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                height: 700,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: snapshot.data?.weeklyNamaz?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: GestureDetector(
                          onTap: () {
                            _show(index);
                          },
                          child: Column(children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              child: Container(
                                color: Colors.green.shade900,
                                padding: const EdgeInsets.all(8),
                                width: double.infinity,
                                child: Text(
                                  "${snapshot.data?.weeklyNamaz?[index].day}",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Azan',
                                    style: TextStyle(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          "${snapshot.data?.weeklyNamaz?[index].azan}",
                                          style: TextStyle(),
                                        ),
                                        IconButton(
                                          iconSize: 15,
                                            onPressed: () {_show(index);},
                                            icon: const Icon(
                                              Icons.edit,
                                              color: Colors.black,
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Jammat',
                                    style: TextStyle(),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "${snapshot.data?.weeklyNamaz?[index].jammat}",
                                        style: TextStyle(),
                                      ),
                                      IconButton(
                                          iconSize: 15,
                                          onPressed: () {_show(index);},
                                          icon: const Icon(
                                            Icons.edit,
                                            color: Colors.black,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ]),
                        ),
                      );
                    }),
              ),




              Card(
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
                          children: const [
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Column(
                            children: const [
                              Text("AZAN"),
                            ],
                          ),
                          Spacer(),
                          const Text(
                            "5:00 PM",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("JAMMAT"),
                                IconButton(
                                  icon: const Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    _showJamat();
                                  },
                                ),
                            ],
                          ),
                        ),

                        Column(
                          children: [
                            for (int i = 0; i < jumma.jammat!.length; i++)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [

                                  GestureDetector(
                                    onTap: (){
                                      _showJamat();
                                    },
                                    child: Text(
                                      jumma.jammat![i],
                                      style: _textStyle,
                                    ),
                                  ),
                                  GestureDetector(
                                    onDoubleTap: () {},
                                    onTap: () {
                                      setState(() {
                                        jumma.jammat?.removeAt(i);
                                        updateMasjid({'jumma': jumma}).then((value) {
                                          AppPreferences.setMasjid(
                                              json.encode(value));
                                          setState(() {

                                          });
                                        });
                                      });
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Icon(
                                        Icons.remove_circle_outline,
                                        size: 18,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                          ],
                        ),
                      ],
                    ),
                  ]))
            ],
          );
        });
  }
}
