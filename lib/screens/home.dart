import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:masjit_vendor_app/data/model/SharePreferenceClass.dart';
import 'package:masjit_vendor_app/data/model/logoutResponse.dart';
import 'package:http/http.dart' as http;
import 'package:masjit_vendor_app/data/model/masjid.dart';
import 'package:masjit_vendor_app/data/model/trustee.dart';
import 'package:masjit_vendor_app/screens/login.dart';
import 'package:masjit_vendor_app/screens/manage_eid.dart';
import 'package:masjit_vendor_app/screens/manage_notification.dart';
import 'package:masjit_vendor_app/screens/registration.dart';
import 'package:masjit_vendor_app/screens/sahr.dart';
import 'package:masjit_vendor_app/utils/constant.dart';
import 'package:masjit_vendor_app/widget/edit_notice.dart';
import 'package:masjit_vendor_app/widget/edit_trustee.dart';
import 'package:masjit_vendor_app/screens/manage_time.dart';
import 'package:masjit_vendor_app/screens/manage_trustee.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _title = 'Weekly Namaz';
  Widget _widget = const ManageTime();
  List<Widget> _actions = <Widget>[];
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
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text(_title), centerTitle: true, actions: _actions),
      drawer: _drawer(),
      body: _widget,
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

                  updateMasjid(trustee).then((value) {
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

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
      }

      return logOutResponseModelFromJson(result.body);
    } catch (e) {
      throw e;
    }
  }
}
