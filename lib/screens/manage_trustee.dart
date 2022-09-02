import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/model/trustee.dart';
import 'package:masjit_vendor_app/widget/edit_trustee.dart';
import 'package:masjit_vendor_app/widget/trustee_card.dart';

class ManageTrustee extends StatefulWidget {
  const ManageTrustee({Key? key}) : super(key: key);

  @override
  State<ManageTrustee> createState() => _ManageTrusteeState();
}

class _ManageTrusteeState extends State<ManageTrustee> {
  final _trustee = [
    Trustee(designation: 'Chairman', name: 'Feroz', contact: '9168682309')
  ];

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
            return EditTrustee(trustee: _trustee[i]);
          });

      result.then((value) {
        if (value != null) {
          setState(() {
            _trustee[i] = value;
          });
        }
      });
    }

    return _trustee.isNotEmpty
        ? ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            physics: const BouncingScrollPhysics(),
            children: [
              for (int i = 0; i < _trustee.length; i++)
                GestureDetector(
                  onTap: () {
                    _show(i);
                  },
                  child: TrusteeCard(trustee: _trustee[i]),
                ),
            ],
          )
        : const Center(
            child: Text("add trustee"),
          );
  }
}
