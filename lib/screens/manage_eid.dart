import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:masjit_vendor_app/model/ed.dart';
import 'package:masjit_vendor_app/model/jammat.dart';
import 'package:masjit_vendor_app/widget/eid_card.dart';

class ManageEid extends StatefulWidget {
  const ManageEid({Key? key}) : super(key: key);

  @override
  State<ManageEid> createState() => _ManageEidState();
}

class _ManageEidState extends State<ManageEid> {
  final _eid = [
    Ed(name: 'EID AL - FITR', jammat: [
      Jammat(name: '1st Jamaat', time: '08:30'),
      Jammat(name: '2nd Jamaat', time: '09:30'),
    ]),
    Ed(name: 'EID AL - ADHA', jammat: [
      Jammat(name: '1st Jamaat', time: '07:30'),
      Jammat(name: '2nd Jamaat', time: '08:30'),
    ]),
  ];
  final _nameEditController = TextEditingController();
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    _show(int i) {
      _selected = i;
      Future<Jammat?> result = showModalBottomSheet<Jammat>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          builder: (context) {
            String? _time;

            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: _nameEditController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Name',
                      hintText: 'Enter Name',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    onDateTimeChanged: (DateTime newTime) {
                      _time = DateFormat.jm().format(newTime);
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(Jammat(
                      name: _nameEditController.text,
                      time: _time ?? DateFormat.jm().format(DateTime.now()),
                    ));
                  },
                  child: const Text('save'),
                )
              ]),
            );
          });

      result.then((value) {
        if (value != null) {
          setState(() {
            _eid[_selected].jammat?.add(value);
          });
        }
      });
    }

    return _eid.isNotEmpty
        ? ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            physics: const BouncingScrollPhysics(),
            children: [
              for (int i = 0; i < _eid.length; i++)
                InkWell(
                  onTap: () {
                    _show(i);
                  },
                  child: EidCard(eid: _eid[i]),
                ),
            ],
          )
        : const Center(
            child: Text("add trustee"),
          );
  }
}
