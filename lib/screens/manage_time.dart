import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/model/namaz_time.dart';
import 'package:masjit_vendor_app/widget/edit_namz_time.dart';
import 'package:masjit_vendor_app/widget/namaz_time_card.dart';

class ManageTime extends StatelessWidget {
  ManageTime({Key? key}) : super(key: key);
  final _time = [
    NamazTime(day: 'FAJR', azan: '05:00', jammt: '05:30'),
    NamazTime(day: 'ZUHAR', azan: '01:00', jammt: '01:30'),
    NamazTime(day: 'ASR', azan: '05:00', jammt: '05:30'),
    NamazTime(day: 'MAGHRIB', azan: '06:30', jammt: '06:35'),
    NamazTime(day: 'ISHA', azan: '08:30', jammt: '08:45'),
    NamazTime(day: 'JUMA', azan: '01:45', jammt: '02:30'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      physics: const BouncingScrollPhysics(),
      children: [
        for (var time in _time)
          InkWell(
            onTap: () {
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
                    return const FractionallySizedBox(
                      heightFactor: 0.7,
                      child: EditNamazTime(),
                    );
                  });
            },
            child: NamazTimeCard(time: time),
          ),
      ],
    );
  }
}
