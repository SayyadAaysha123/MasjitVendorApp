import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/feature/presentation/Trustee.dart';

class ManageTrustee extends StatefulWidget {
  const ManageTrustee({Key? key}) : super(key: key);

  @override
  State<ManageTrustee> createState() => _ManageTrusteeState();
}

class _ManageTrusteeState extends State<ManageTrustee> {
  final _trustee = <Trustee>[];
  @override
  Widget build(BuildContext context) {
    return _trustee.isNotEmpty
        ? ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            physics: const BouncingScrollPhysics(),
            children: [
              for (var time in _trustee) const SizedBox.shrink(),
            ],
          )
        : const Center(
            child: Text("add trustee"),
          );
  }
}
