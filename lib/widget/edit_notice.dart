import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/data/model/notice.dart';
import 'package:masjit_vendor_app/data/model/noticeCreate.dart';
import 'package:http/http.dart' as http;
import 'package:masjit_vendor_app/screens/home.dart';
import 'package:masjit_vendor_app/screens/manage_notification.dart';
import 'package:masjit_vendor_app/utils/constant.dart';

class EditNotice extends StatefulWidget {
  EditNotice({
    Key? key,
  }) : super(key: key);

  @override
  State<EditNotice> createState() => _EditNoticeState();
}

class _EditNoticeState extends State<EditNotice> {
  final _nameEditController = TextEditingController();

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


    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${box.get(kToken)}'
    };
    final msg = jsonEncode({
      "masjid_id": masjid.id.toString(),
      "notices": _nameEditController.text.trim()
    });

    var response = await http.post(
      Uri.parse("http://masjid.exportica.in/api/masjids/notice/"),
      headers: headers,
      body: msg,
    );

    if (response.statusCode == 200) {

      if(mounted) {
        setState(() {
        getAllNotices();
      });
      }

      Navigator.pop(context);


      print("Yess.. ${response.body}");

      print("Hiii");

      return noticesCreateResponseModelFromJson(response.body);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  Future<GetAllNoticesResponseModel> getAllNotices() async {
    try {
      final result = await http.get(
        Uri.parse("http://masjid.exportica.in/api/masjids/${masjid.id}/notice"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${box.get(kToken)}'
        },
      );

      if(result.statusCode == 200){
        print(result.body);
      }

      return getAllNoticesResponseModelFromJson(result.body);
    } catch (e) {
      throw e;
    }
  }

}
