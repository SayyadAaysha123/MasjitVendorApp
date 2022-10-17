import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/data/model/SharePreferenceClass.dart';
import 'package:masjit_vendor_app/data/model/masjid.dart';
import 'package:masjit_vendor_app/data/model/noticeCreate.dart';
import 'package:http/http.dart' as http;
import 'package:masjit_vendor_app/data/update_masjid.dart';
import 'package:masjit_vendor_app/screens/home.dart';

class EditMasjidName extends StatefulWidget {
  EditMasjidName({Key? key}) : super(key: key);

  @override
  State<EditMasjidName> createState() => _EditMasjidNameState();
}

class _EditMasjidNameState extends State<EditMasjidName> {
  final _nameEditController = TextEditingController();
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
    return Padding(
      padding: MediaQuery
          .of(context)
          .viewInsets,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              'Add New Masjid Name',
              style: Theme
                  .of(context)
                  .textTheme
                  .subtitle2,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _nameEditController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Masjid Name',
                hintText: 'Enter Masjid Name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  updateMasjid({'masjid_name': _nameEditController.text.trim()})
                      .then((value) {
                    AppPreferences.setMasjid(json.encode(value));
                    // AppPreferences.setMasjidName(_nameEditController.text.trim());
                    setState(() {});
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => const Home()));
                  });
                },
                child: const Text('Save'))
          ],
        ),
      ),
    );
  }


}



