import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/data/model/SharePreferenceClass.dart';
import 'package:masjit_vendor_app/data/model/masjid.dart';
import 'package:masjit_vendor_app/data/update_masjid.dart';
import 'package:masjit_vendor_app/widget/edit_trustee.dart';
import 'package:masjit_vendor_app/widget/trustee_card.dart';

import '../data/model/trustee.dart';




var trustee = [
  Trustee(designation: 'Chairman', name: 'Feroz', contact: '9168682309')
];

class ManageTrustee extends StatefulWidget {
  const ManageTrustee({Key? key}) : super(key: key);

  @override
  State<ManageTrustee>   createState() => _ManageTrusteeState();
}

class _ManageTrusteeState extends State<ManageTrustee> {



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

    trustee = masjid1?.trustee ?? trustee;
  }

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

        updateMasjid({'trustee':trustee}).then((value) {
          AppPreferences.setMasjid(json.encode(value));
        });

      });
    }

    return trustee.isNotEmpty
        ? ListView(
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
          )
        : const Center(
            child: Text("add trustee"),
          );
  }

}

