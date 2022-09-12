import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/data/model/namaz_time.dart';
import 'package:masjit_vendor_app/widget/edit_namz_time.dart';
import 'package:masjit_vendor_app/widget/namaz_time_card.dart';

class ManageTime extends StatefulWidget {
  const ManageTime({Key? key}) : super(key: key);

  @override
  State<ManageTime> createState() => _ManageTimeState();
}

class _ManageTimeState extends State<ManageTime> {
  final _time = [
    WeeklyNamaz(day: 'FAJR', azan: '05:00 AM', jammat: '05:30 AM'),
    WeeklyNamaz(day: 'ZUHAR', azan: '01:00 AM', jammat: '01:30 AM'),
    WeeklyNamaz(day: 'ASR', azan: '05:00 AM', jammat: '05:30 AM'),
    WeeklyNamaz(day: 'MAGHRIB', azan: '06:30 AM', jammat: '06:35 AM'),
    WeeklyNamaz(day: 'ISHA', azan: '08:30 AM', jammat: '08:45 AM'),
    WeeklyNamaz(day: 'JUMA', azan: '01:45 AM', jammat: '02:30 AM'),
  ];

  @override
  Widget build(BuildContext context) {
    _show(int i) {
      Future<WeeklyNamaz?> newTime = showModalBottomSheet<WeeklyNamaz?>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          builder: (context) {
            return FractionallySizedBox(
              heightFactor: 0.7,
              child: EditNamazTime(time: _time[i]),
            );
          });

      newTime.then((value) {
        if (value != null) {
          setState(() {
            _time[i] = value;
          });
        }
      });
    }

    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      physics: const BouncingScrollPhysics(),
      children: [
        for (int i = 0; i < _time.length; i++)
          GestureDetector(
            onTap: () {
              _show(i);
            },
            child: NamazTimeCard(time: _time[i]),
          ),
      ],
    );
  }
}
