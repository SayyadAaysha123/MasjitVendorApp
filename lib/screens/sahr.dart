import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sahr extends StatefulWidget {
  const Sahr({Key? key}) : super(key: key);

  @override
  State<Sahr> createState() => _SahrState();
}

class _SahrState extends State<Sahr> {
  @override
  Widget build(BuildContext context) {
    TextStyle? _textStyle = Theme.of(context).textTheme.subtitle2;
    int _index = 0;
    String _sahr = '5:30 AM';
    String _iftar = '5:30 AM';
    String _time = '';

    _showBottomSheet(int i) {
      _index = i;
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
            return FractionallySizedBox(
              heightFactor: 0.3,
              child: Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    onDateTimeChanged: (DateTime newTime) {
                      setState(() {
                        _time = '''${newTime.hour}:${newTime.minute}''';
                      });
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_index == 0) {
                      _sahr = _time;
                    } else {
                      _iftar = _time;
                    }

                    setState(() {});
                  },
                  child: const Text('save'),
                )
              ]),
            );
          });
    }

    return Column(
      children: [
        Card(
          child: InkWell(
            onTap: () {
              _showBottomSheet(0);
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SAHR',
                      style: _textStyle,
                    ),
                    Text(_sahr),
                  ]),
            ),
          ),
        ),
        Card(
          child: InkWell(
            onTap: () {
              _showBottomSheet(1);
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'IFTAR',
                      style: _textStyle,
                    ),
                    Text(_iftar),
                  ]),
            ),
          ),
        )
      ],
    );
  }
}
