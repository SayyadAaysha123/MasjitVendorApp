import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:masjit_vendor_app/data/model/SharePreferenceClass.dart';
import 'package:masjit_vendor_app/data/model/eid.dart';
import 'package:masjit_vendor_app/data/model/masjid.dart';
import 'package:http/http.dart' as http;

class EidCard extends StatefulWidget {
  const EidCard({
    Key? key,
    required this.eid,
  }) : super(key: key);

  final Eid eid;

  @override
  State<EidCard> createState() => _EidCardState();
}

class _EidCardState extends State<EidCard> {

  int _selected = 0;
  final _nameEditController = TextEditingController();

  Eid? eid;
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
          print("Hii");
          eid?.jammat?.add(value);
          updateMasjid().then((value) {
            AppPreferences.setMasjid(json.encode(value));
          });

        }
      });
    }


    TextStyle? _textStyle = Theme.of(context).textTheme.bodyLarge;
    return Card(
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
                    widget.eid.name!,
                    style: _textStyle?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // _show();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Jammat',
                style: _textStyle,
              ),

              Column(
                children: [
                  for (int i = 0; i < widget.eid.jammat!.length; i++)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        Text(
                          widget.eid.jammat![i],
                          style: _textStyle,
                        ),


                        GestureDetector(
                          onDoubleTap: (){},
                          onTap: (){
                            setState(() {
                              widget.eid.jammat?.removeAt(i);
                              updateMasjid().then((value) {
                                AppPreferences.setMasjid(json.encode(value));
                              });
                            });

                          },
                          child: const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(Icons.remove_circle_outline,
                              size: 18,),
                          ),
                        )
                      ],
                    ),
                ],
              ),


            ],
          ),
        )
      ]),
    );
  }

  Future<Masjid> updateMasjid() async {

    print("iiiii $masjidId");
    print("hhhhh $token");

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






/*Future<Masjid> updateMasjid() async {


  String? token;
  String? masjidId;

  AppPreferences.getIds().then((value) {
    masjidId = value;
  });
  AppPreferences.getToken().then((value) {
    token = value;
  });


  final http.Response response = await http.put(
    Uri.parse("http://masjid.exportica.in/api/masjids/$masjidId"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
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
}*/
