import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/data/model/SharePreferenceClass.dart';
import 'package:masjit_vendor_app/data/model/masjid.dart';
import 'package:masjit_vendor_app/data/model/noticeCreate.dart';
import 'package:http/http.dart' as http;


class EditNotice extends StatefulWidget {
  EditNotice({
    Key? key,
  }) : super(key: key);

  @override
  State<EditNotice> createState() => _EditNoticeState();
}

class _EditNoticeState extends State<EditNotice> {
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
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              'add notice',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _nameEditController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Notice',
                hintText: 'Enter Notice',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  createNotice();
                  // Navigator.pop(context);
                },
                child: const Text('Save'))
          ],
        ),
      ),
    );
  }

  Future<NoticesCreateResponseModel> createNotice() async {

    String? token = await AppPreferences.getToken();
    String? id = await AppPreferences.getIds();
    print("idddddd $id");


    try {
      var headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };

      final msg = jsonEncode({
        "masjid_id": id,
        "notice": _nameEditController.text.trim()
      });

      print('headers');

      print(headers);
      final result = await http.put(
        Uri.parse("http://masjid.exportica.in/api/$id/notice"),
        headers: headers,
        body: msg
      );

      print(result.body);

      return noticesCreateResponseModelFromJson(result.body);
    } catch (e) {
      throw e;
    }

/*    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
    final msg = jsonEncode({
      "masjid_id": masjidId,
      "notices": _nameEditController.text.trim()
    });

    var response = await http.post(
      Uri.parse("http://masjid.exportica.in/api/$id/notice"),
      headers: headers,
      body: msg,
    );

    if (response.statusCode == 200) {
      Navigator.pop(context);

      print("Yess.. ${response.body}");

      print("Hiii");

      return noticesCreateResponseModelFromJson(response.body);
    } else {
      throw Exception('Failed to create album.');
    }*/
  }
}
