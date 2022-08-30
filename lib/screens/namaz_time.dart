import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/widget/namaz_time_card.dart';

class NamazTime extends StatelessWidget {
  const NamazTime({Key? key}) : super(key: key);
  final _time = const [
    {'title': 'FAJR', 'azan': '05:00', 'jammt': '05:30'},
    {'title': 'de', 'azan': '05:00', 'jammt': '05:30'},
    {'title': 'FAdsfsfJR', 'azan': '05:00', 'jammt': '05:30'},
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
        for (var time in _time) NamazTimeCard(time: time),
      ],
    );
  }
}
