import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/model/trustee.dart';

class TrusteeCard extends StatelessWidget {
  const TrusteeCard({
    Key? key,
    required this.trustee,
  }) : super(key: key);

  final Trustee trustee;

  @override
  Widget build(BuildContext context) {
    TextStyle? _textStyle = Theme.of(context).textTheme.bodyLarge;
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        child: Column(children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Container(
              color: Colors.green.shade900,
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              child: Text(
                trustee.designation!,
                style: _textStyle?.copyWith(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  trustee.name!,
                  style: _textStyle,
                ),
                Text(
                  trustee.contact!,
                  style: _textStyle,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
