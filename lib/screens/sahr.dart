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
              masjid1?.sahr = _sahr;
            } else {
              _iftar = value;
              masjid1?.iftar = _iftar;
            }

            updateMasjid({'sahr': _sahr, 'iftar': _iftar}).then((value) {
              masjid1?.sahr = _sahr;
              masjid1?.iftar = _iftar;
              AppPreferences.setMasjid(json.encode(value));
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
    });

  }
}
