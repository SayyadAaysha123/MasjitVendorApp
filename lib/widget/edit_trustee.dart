import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/data/model/trustee.dart';

class EditTrustee extends StatelessWidget {
  EditTrustee({Key? key, this.trustee}) : super(key: key);

  final Trustee? trustee;

  final _nameEditController = TextEditingController();
  final _designationEditController = TextEditingController();
  final _contactEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameEditController.text = trustee?.name ?? '';
    _designationEditController.text = trustee?.designation ?? '';
    _contactEditController.text = trustee?.contact ?? '';

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              'add trustee',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _nameEditController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Name',
                hintText: 'Enter Name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _designationEditController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Designation',
                hintText: 'Enter Designation',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _contactEditController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Contact',
                hintText: 'Enter Contact',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(
                      Trustee(
                          name: _nameEditController.text.trim(),
                          designation: _designationEditController.text.trim(),
                          contact: _contactEditController.text.trim(),
                        )
                  );
                },
                child: const Text('Save'))
          ],
        ),
      ),
    );
  }
}
