import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:masjit_vendor_app/model/namaz_time.dart';

class EditNamazTime extends StatefulWidget {
  const EditNamazTime({
    Key? key,
    required this.time,
  }) : super(key: key);

  final NamazTime time;

  @override
  State<EditNamazTime> createState() => _EditNamazTimeState();
}

class _EditNamazTimeState extends State<EditNamazTime> {
  String _selection = '';

  @override
  Widget build(BuildContext context) {
    TextStyle? _textStyle =
        Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.white);

    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          _selection,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      Expanded(
        child: _selection.isNotEmpty
            ? CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: DateFormat('jm').parse(_selection == 'Azan'
                    ? widget.time.azan!
                    : widget.time.jammt!),
                onDateTimeChanged: (DateTime newTime) {
                  DateFormat.jm().format(newTime);
                  if (_selection == 'Azan') {
                    widget.time.azan = DateFormat.jm().format(newTime);
                  } else {
                    widget.time.jammt = DateFormat.jm().format(newTime);
                  }

                  setState(() {});
                },
              )
            : const Center(child: Text('Choose to edit')),
      ),
      Container(
        height: MediaQuery.of(context).size.height * .4,
        decoration: BoxDecoration(
          color: Colors.green.shade900,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              widget.time.day!,
              style: _textStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              Text(
                'Azan',
                style: _textStyle,
              ),
              const Spacer(),
              Text(
                widget.time.azan!,
                style: _textStyle,
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      _selection = 'Azan';
                    });
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  )),
            ]),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              Text(
                'Jammat',
                style: _textStyle,
              ),
              const Spacer(),
              Text(
                widget.time.jammt!,
                style: _textStyle,
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      _selection = 'Jammat';
                    });
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  )),
            ]),
          ),
          const Divider(),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancle'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(widget.time);
                      },
                      child: const Text('Save')),
                ]),
          )
        ]),
      ),
    ]);
  }
}
