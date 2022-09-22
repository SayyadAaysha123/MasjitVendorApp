import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/data/model/SharePreferenceClass.dart';
import 'package:masjit_vendor_app/data/model/getAllNoticeResponseModel.dart';
import 'package:masjit_vendor_app/data/model/logoutResponse.dart';
import 'package:http/http.dart' as http;
import 'package:masjit_vendor_app/data/model/masjid.dart';
import 'package:masjit_vendor_app/data/model/trustee.dart';
import 'package:masjit_vendor_app/data/update_masjid.dart';
import 'package:masjit_vendor_app/screens/exit_dialog.dart';
import 'package:masjit_vendor_app/screens/login.dart';
import 'package:masjit_vendor_app/screens/manage_eid.dart';
import 'package:masjit_vendor_app/screens/manage_notification.dart';
import 'package:masjit_vendor_app/screens/sahr.dart';
import 'package:masjit_vendor_app/widget/edit_notice.dart';
import 'package:masjit_vendor_app/widget/edit_trustee.dart';
import 'package:masjit_vendor_app/screens/manage_time.dart';
import 'package:masjit_vendor_app/screens/manage_trustee.dart';

class Home extends StatefulWidget {
  final String come;

  const Home({Key? key, this.come = ""}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String? _title;
  Widget? _widget;
  List<Widget>? _actions;
  Masjid? masjid1;
  String? token;
  String? masjidId;

  Future<void> init() async {
    masjid1 = await AppPreferences.getMasjid();
    token = await AppPreferences.getToken();
    masjidId = await AppPreferences.getIds();
  }


  @override
  void initState() {
    super.initState();
    init();
    _widget = widget.come == "1"
        ? ManageNotification()
        : widget.come == "2"
            ? ManageTrustee()
            : ManageTime();
    _title = widget.come == "1"
        ? 'Notice'
        : widget.come == "2"
            ? "Trustee"
            : 'Weekly Namaz';

    _actions = widget.come == "1"
        ? _actions = [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) {
                        return EditNotice();
                      });
                },
                icon: const Icon(Icons.add_circle))
          ]
        : <Widget>[];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:  _onBackPressed,
      child: Scaffold(
        key: _scaffoldKey,
        appBar:
            AppBar(title: Text(_title!), centerTitle: true, actions: _actions),
        drawer: _drawer(),
        body: _widget,
      ),
    );
  }

  _pageChange(int page) {
    switch (page) {
      case 0:
        _title = 'Weekley Namaz Time';
        _widget = const ManageTime();
        _actions = [];
        break;
      case 1:
        _title = 'SAHR / IFTAR';
        _widget = const Sahr();
        _actions = [];
        break;
      case 2:
        _title = 'Eid';
        _widget = const ManageEid();
        _actions = [];
        break;
      case 3:
        _title = 'Notice';
        _widget = const ManageNotification();
        _actions = [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) {
                      return EditNotice();
                    });
              },
              icon: const Icon(Icons.add_circle))
        ];
        break;
      case 4:
        _title = 'Trustee';
        _widget = const ManageTrustee();
        _actions = [
          IconButton(
              onPressed: () {
                Future<Trustee?> list = showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) {
                      return EditTrustee();
                    });

                list.then((value) {
                  if (value == null) {
                    return;
                  }

                  trustee.add(value);

                  updateMasjid({'trustee':trustee}).then((value) {
                    AppPreferences.setMasjid(json.encode(value));
                    setState(() {});
                  });
                });
              },
              icon: const Icon(Icons.add_circle))
        ];
        break;
      case 5:
        _title = 'Privacy Policy';
        break;
      case 6:
        _title = 'Terms & Condition';
        break;
      case 7:
        _title = 'Logout';
        break;
    }

    // _scaffoldKey.currentState?.closeDrawer();

    setState(() {});
  }

  Drawer _drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green.shade900,
            ),
            child: const Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Weekley Namaz Time'),
            onTap: () {
              _pageChange(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('SAR / IFTAR'),
            onTap: () {
              _pageChange(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Eid'),
            onTap: () {
              _pageChange(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Notice'),
            onTap: () {
              _pageChange(3);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Trustee'),
            onTap: () {
              _pageChange(4);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            onTap: () {
              _pageChange(5);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Terms & Condition'),
            onTap: () {
              _pageChange(6);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              getLogoutData();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Future<LogOutResponseModel> getLogoutData() async {
    String? token = await AppPreferences.getToken();
    print(token);

    try {
      final result = await http.get(
        Uri.parse("http://masjid.exportica.in/api/user/logout"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
      );

      if (result.statusCode == 200) {
        print("Hii ${result.body}");
        AppPreferences.clearAppPreference();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
      }

      return logOutResponseModelFromJson(result.body);
    } catch (e) {
      throw e;
    }
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

  static showExitDialog(BuildContext context) {
    if (context != null) {
      showGeneralDialog(
          barrierColor: Colors.black.withOpacity(0.5),
          transitionBuilder: (context, a1, a2, widget) {
            final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
            // return Transform(
            //   transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            return Transform.scale(
              scale: a1.value,
              child: Opacity(
                opacity: a1.value,
                child: ExitAppDialog(
                  message: "Are You Sure To Exit",
                ),
              ),
            );
          },
          transitionDuration: Duration(milliseconds: 200),
          barrierDismissible: true,
          barrierLabel: '',
          context: context,
          pageBuilder: (context, animation2, animation1) {
            return Container();
          });
    }
  }

  Future<bool> _onBackPressed() {
    return showExitDialog(context);
  }



}
