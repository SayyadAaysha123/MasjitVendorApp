import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/data/model/SharePreferenceClass.dart';
import 'package:masjit_vendor_app/data/model/masjid.dart';
import 'package:masjit_vendor_app/data/model/getAllNoticeResponseModel.dart';
import 'package:http/http.dart' as http;

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


    if(mounted){
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


      if(result.statusCode == 200){
        print(result.body);
      }


      return getAllNoticesFromJson(result.body);
    } catch (e) {
      throw e;
    }
  }



/*  Future<GetAllNotices> getNoticeData() async {

    try {
      final result = await http.get(
        Uri.parse("http://masjid.exportica.in/api/masjids/$masjidId/notice"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );

      if(result.statusCode == 200){
        print("Hii ${result.body}");

      }


      return getAllNoticesFromJson(result.body);
    } catch (e) {
      throw e;
    }
  }*/


}
