import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:masjit_vendor_app/data/model/SharePreferenceClass.dart';
import 'package:masjit_vendor_app/data/model/masjid.dart';
import 'package:masjit_vendor_app/data/update_masjid.dart';

class Sahr extends StatefulWidget {
  const Sahr({Key? key}) : super(key: key);

  @override
  State<Sahr> createState() => _SahrState();
}

class _SahrState extends State<Sahr> {
  String _sahr = '5:30 AM';
  String _iftar = '5:30 AM';

  Masjid? masjid1;
  String? token;
  String? masjidId;

  @override
  void initState() {
    super.initState();

    AppPreferences.getMasjid().then((value) {
      if (value == null) return;
      masjid1 = value;
      print(masjid1?.id);
    });

    AppPreferences.getToken().then((value) {
      token = value;
      print(token);
    });

    AppPreferences.getIds().then((value) {
      masjidId = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? _textStyle = Theme.of(context).textTheme.subtitle2;

    _showBottomSheetSahr(int i, String time) {
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

            setState(() {
              masjid1?.sahr = value;
              updateMasjid({'sahr': value}).then((value) {
                AppPreferences.setMasjid(json.encode(value));
                setState(() {});
              });
            });

            /* if (i == 0) {
              _sahr = value;
              masjid1?.sahr = _sahr;
            } else {
              _iftar = value;
              masjid1?.iftar = _iftar;
            }

            updateMasjid({'sahr': _sahr}).then((value) {
              // masjid1?.sahr = _sahr;
              AppPreferences.setMasjid(json.encode(value));
            });*/
          }));
    }

    _showBottomSheetIftar(int i, String time) {
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

            /*  if (i == 0){
              _iftar = value;
              masjid1?.iftar = _iftar;
            }

            updateMasjid({'sahr': _sahr, 'iftar': _iftar}).then((value) {
              masjid1?.sahr = _sahr;
              masjid1?.iftar = _iftar;
              AppPreferences.setMasjid(json.encode(value));
            });*/

            setState(() {
              masjid1?.iftar = value;
              updateMasjid({'iftar': value}).then((value) {
                AppPreferences.setMasjid(json.encode(value));
                setState(() {});
              });
            });
          }));
    }

    return FutureBuilder<Masjid?>(
        future: AppPreferences.getMasjid(),
        builder: (context, snapshot) {
          _sahr = snapshot.data?.sahr ?? _sahr;
          _iftar = snapshot.data?.iftar ?? _iftar;
          return Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SAHR',
                          style: _textStyle,
                        ),
                        GestureDetector(
                          onTap: () {
                            _showBottomSheetSahr(0, _sahr);
                            print("_sahr ");
                          },
                          child: Container(
                              color: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    Text(_sahr),
                                    IconButton(
                                        iconSize: 15,
                                        onPressed: () {_showBottomSheetSahr(0, _sahr);},
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                              )),
                        ),
                      ]),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'IFTAR',
                          style: _textStyle,
                        ),
                        GestureDetector(
                          onTap: () {
                            _showBottomSheetIftar(0, _iftar);
                            print("_iftar ");
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Text(_iftar),
                                  IconButton(
                                      iconSize: 15,
                                      onPressed: () { _showBottomSheetIftar(0, _iftar);},
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.black,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              )
            ],
          );
        });
  }
}
