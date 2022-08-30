import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/widget/edit_namz_time.dart';

class NamazTimeCard extends StatelessWidget {
  const NamazTimeCard({
    Key? key,
    required this.time,
  }) : super(key: key);

  final Map<String, String> time;

  @override
  Widget build(BuildContext context) {
    TextStyle? _textStyle = Theme.of(context).textTheme.headline6;
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
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
        child: Column(children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Container(
              color: Colors.green.shade900,
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              child: Text(
                time['title']!,
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
                  'Azan',
                  style: _textStyle,
                ),
                Text(
                  time['azan']!,
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
                  time['jammt']!,
                  style: _textStyle,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
