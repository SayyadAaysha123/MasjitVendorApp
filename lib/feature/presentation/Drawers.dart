import 'package:flutter/material.dart';


class Drawers extends StatefulWidget {
  const Drawers({Key? key}) : super(key: key);

  @override
  _DrawersState createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     drawer: Drawer(
       child: ListView(
         padding: EdgeInsets.zero,
         children: const <Widget>[
           DrawerHeader(
             decoration: BoxDecoration(
               color: Colors.blue,
             ),
             child: Text(
               'Drawer Header',
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 24,
               ),
             ),
           ),
           ListTile(
             leading: Icon(Icons.message),
             title: Text('Messages'),
           ),
           ListTile(
             leading: Icon(Icons.account_circle),
             title: Text('Profile'),
           ),
           ListTile(
             leading: Icon(Icons.settings),
             title: Text('Settings'),
           ),
         ],
       ),
     ),
      appBar: AppBar(

        title: const Text('Drawer Demo'),
        leading: IconButton(
          icon: Icon(Icons.accessible),
          onPressed: () => Scaffold.of(context).openDrawer()
        ),

 // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      ),

    );
  }
}
