import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:masjit_vendor_app/data/model/SharePreferenceClass.dart';
import 'package:masjit_vendor_app/data/model/deleteNotice.dart';
import 'package:masjit_vendor_app/data/model/masjid.dart';
import 'package:masjit_vendor_app/data/model/getAllNoticeResponseModel.dart';
import 'package:http/http.dart' as http;
import 'package:masjit_vendor_app/screens/home.dart';

class ManageNotification extends StatefulWidget {
  const ManageNotification({Key? key}) : super(key: key);

  @override
  State<ManageNotification> createState() => _ManageNotificationState();
}

class _ManageNotificationState extends State<ManageNotification> {
  var getNoticesData;

  Masjid? masjid1;
  String? masjidId;
  String? token;

  @override
  void initState() {
    super.initState();

    setState(() {
      getNoticesData = getAllNotices();
    });

    if (mounted) {
      setState(() {
        AppPreferences.getMasjid().then((value) {
          if (value == null) return;
          masjid1 = value;
        });
        AppPreferences.getIds().then((value) {
          masjidId = value;
          print("aaaaa $masjidId");
        });
        AppPreferences.getToken().then((value) {
          token = value;
        });
      });
    }

    // getNoticeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<GetAllNotices>(
          future: getNoticesData,
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data?.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.green, width: 1)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  snapshot.data?.data?[index].notice != null
                                      ? "${snapshot.data?.data?[index].notice}"
                                      : "",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 17),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        snapshot.data?.data?[index].createdAt !=
                                                null
                                            ? Text(
                                                DateFormat("dd/MM/yyyy").format(
                                                    DateTime.parse(
                                                        "${snapshot.data?.data?[index].createdAt}")),
                                              )
                                            : Text(""),
                                        snapshot.data?.data?[index].createdAt !=
                                                null
                                            ? Text(
                                                DateFormat().add_jm().format(
                                                    DateTime.parse(
                                                            "${snapshot.data?.data?[index].createdAt}")
                                                        .add(Duration(
                                                            hours: 5,
                                                            minutes: 30))),
                                              )
                                            : Text(""),
                                      ],
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.remove_circle_outline,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        deleteNotices(
                                            snapshot.data?.data?[index].id);
                                        setState(() {

                                        });
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                  );
                });
          }),
    );
  }

  Future<GetAllNotices> getAllNotices() async {
    String? token = await AppPreferences.getToken();
    String? id = await AppPreferences.getIds();
    print(token);

    try {
      var headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };

      print('headers');
      print(headers);
      final result = await http.get(
        Uri.parse("http://masjid.exportica.in/api/masjids/$id/notice"),
        headers: headers,
      );

      if (result.statusCode == 200) {
        print(result.body);
      }

      return getAllNoticesFromJson(result.body);
    } catch (e) {
      throw e;
    }
  }

  Future<DeleteNotices> deleteNotices(noticeId) async {
    String? token = await AppPreferences.getToken();
    String? id = await AppPreferences.getIds();
    print(token);

    try {
      var headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };

      print('headers');
      print(headers);
      final result = await http.delete(
        Uri.parse("http://masjid.exportica.in/api/masjids/$noticeId/notice"),
        headers: headers,
      );

      if (result.statusCode == 200) {
        print(result.body);
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Notice Successfully Deleted.")));
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home(come: "1",)));
        });
      }

      return deleteNoticesFromJson(result.body);
    } catch (e) {
      throw e;
    }
  }
}
