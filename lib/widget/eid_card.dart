import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/data/model/eid.dart';

class EidCard extends StatelessWidget {
  const EidCard({
    Key? key,
    required this.eid,
  }) : super(key: key);

  final Eid eid;

  @override
  Widget build(BuildContext context) {
    TextStyle? _textStyle = Theme.of(context).textTheme.bodyLarge;
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(10),
          ),
          child: Container(
            color: Colors.green.shade900,
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    eid.name!,
                    style: _textStyle?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Azan',
                style: _textStyle,
              ),
              Text(
                "5:00",
                style: _textStyle,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Jammat',
                style: _textStyle,
              ),
              Text(
                '7:00',
                style: _textStyle,
              )
            ],
          ),
        )
      ]),
    );
  }
}
