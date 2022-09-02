import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/widget/edit_notice.dart';

class ManageNotification extends StatefulWidget {
  const ManageNotification({Key? key}) : super(key: key);

  @override
  State<ManageNotification> createState() => _ManageNotificationState();
}

class _ManageNotificationState extends State<ManageNotification> {
  final _notice = [];

  @override
  Widget build(BuildContext context) {
    _show(int i) {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          builder: (context) {
            return EditNotice();
          });
    }

    return _notice.isNotEmpty
        ? ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            physics: const BouncingScrollPhysics(),
            children: [
              for (int i = 0; i < _notice.length; i++)
                GestureDetector(
                  onTap: () {
                    _show(i);
                  },
                  child: Card(child: Text(_notice[i])),
                ),
            ],
          )
        : const Center(
            child: Text("add notification"),
          );
  }
}
