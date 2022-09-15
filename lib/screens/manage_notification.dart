import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/data/model/notice.dart';
import 'package:masjit_vendor_app/data/model/noticeCreate.dart';
import 'package:masjit_vendor_app/screens/home.dart';
import 'package:masjit_vendor_app/utils/constant.dart';
import 'package:masjit_vendor_app/widget/edit_notice.dart';
import 'package:http/http.dart' as http;

class ManageNotification extends StatefulWidget {
  const ManageNotification({Key? key}) : super(key: key);

  @override
  State<ManageNotification> createState() => _ManageNotificationState();
}

class _ManageNotificationState extends State<ManageNotification> {
  var _notice = [];

  late Future<GetAllNoticesResponseModel> result;

  var getNoticesData;

  @override
  void initState() {
    super.initState();

    result = getAllNotices();

    if (mounted) {
      setState(() {
        getNoticesData = getAllNotices();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<GetAllNoticesResponseModel>(
          future: getNoticesData,
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data?.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 20.0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  snapshot.data?.data?[index] != null
                                      ? "${snapshot.data?.data?[index]}"
                                      : "",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        )),
                  );
                });
          }),
    );
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

      if (result.statusCode == 200) {
        print(result.body);
      }

      return getAllNoticesResponseModelFromJson(result.body);
    } catch (e) {
      throw e;
    }
  }
}
