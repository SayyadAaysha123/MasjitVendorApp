import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class EditNamazTime extends StatefulWidget {
  const EditNamazTime({
    Key? key,
  }) : super(key: key);

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
                onDateTimeChanged: (DateTime newTime) {},
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
              'FAZR',
              style: _textStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              Text(
                'FAZR',
                style: _textStyle,
              ),
              const Spacer(),
              Text(
                'FAZR',
                style: _textStyle,
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      _selection = 'azan';
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
                'FAZR',
                style: _textStyle,
              ),
              const Spacer(),
              Text(
                'FAZR',
                style: _textStyle,
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      _selection = 'jammat';
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
                    onPressed: () {},
                    child: const Text('Cancle'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text('Save')),
                ]),
          )
        ]),
      ),
    ]);
  }
}
