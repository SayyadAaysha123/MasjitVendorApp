import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/screens/manage_eid.dart';
import 'package:masjit_vendor_app/screens/sahr.dart';
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
        break;
      case 4:
        _title = 'Trustee';
        _widget = const ManageTrustee();
        _actions = [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    builder: (context) {
                      return EditTrustee();
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

    _scaffoldKey.currentState?.closeDrawer();

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
            },
          ),
          ListTile(
            title: const Text('SAR / IFTAR'),
            onTap: () {
              _pageChange(1);
            },
          ),
          ListTile(
            title: const Text('Eid'),
            onTap: () {
              _pageChange(2);
            },
          ),
          ListTile(
            title: const Text('Notice'),
            onTap: () {
              _pageChange(3);
            },
          ),
          ListTile(
            title: const Text('Trustee'),
            onTap: () {
              _pageChange(4);
            },
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            onTap: () {
              _pageChange(5);
            },
          ),
          ListTile(
            title: const Text('Terms & Condition'),
            onTap: () {
              _pageChange(6);
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              _pageChange(7);
            },
          ),
        ],
      ),
    );
  }
}
