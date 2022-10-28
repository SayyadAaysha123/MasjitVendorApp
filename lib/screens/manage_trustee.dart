import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/data/model/SharePreferenceClass.dart';
import 'package:masjit_vendor_app/data/model/masjid.dart';
import 'package:masjit_vendor_app/data/update_masjid.dart';
import 'package:masjit_vendor_app/widget/edit_trustee.dart';
import 'package:masjit_vendor_app/widget/trustee_card.dart';

import '../data/model/trustee.dart';

var trustee = <Trustee>[];

class ManageTrustee extends StatefulWidget {
  const ManageTrustee({Key? key}) : super(key: key);

  @override
  State<ManageTrustee> createState() => _ManageTrusteeState();
}

class _ManageTrusteeState extends State<ManageTrustee> {



  @override
  Widget build(BuildContext context) {
    _show(int i) {
      final result = showModalBottomSheet<Trustee?>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          builder: (context) {
            return EditTrustee(trustee: trustee[i]);
          });

      result.then((value) {
        if (value != null) {
          setState(() {
            trustee[i] = value;
          });
        }

        updateMasjid({'trustee': trustee}).then((value) {
          AppPreferences.setMasjid(json.encode(value));
          setState(() {});
        });
      });
    }

    return FutureBuilder<Masjid?>(
        future: AppPreferences.getMasjid(),
        builder: (context, snapshot) {
          trustee=snapshot.data?.trustee??[];
          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            physics: const BouncingScrollPhysics(),
            children: [
              for (int i = 0; i < trustee.length; i++)
                GestureDetector(
                  onTap: () {
                    _show(i);
                  },
                  child: TrusteeCard(trustee: trustee[i]),
                ),
            ],
          );
        });
  }
}
