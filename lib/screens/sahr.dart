import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sahr extends StatefulWidget {
  const Sahr({Key? key}) : super(key: key);

  @override
  State<Sahr> createState() => _SahrState();
}

class _SahrState extends State<Sahr> {
  String _sahr = '5:30 AM';
  String _iftar = '5:30 AM';

  @override
  Widget build(BuildContext context) {
    TextStyle? _textStyle = Theme.of(context).textTheme.subtitle2;

    _showBottomSheet(int i) {
      Future<String?> result = showModalBottomSheet<String>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          builder: (context) {
            String? _time;
            return Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  onDateTimeChanged: (DateTime newTime) {
                    _time = '''${newTime.hour}:${newTime.minute}''';
                    print(_time);
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_time);
                  Navigator.of(context).pop(_time);
                },
                child: const Text('save'),
              )
            ]);
          });

      result.then((value) => setState(() {
            print('this is $value');
            if (i == 0) {
              _sahr = value ?? '';
            } else {
              _iftar = value ?? '';
            }
          }));
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
