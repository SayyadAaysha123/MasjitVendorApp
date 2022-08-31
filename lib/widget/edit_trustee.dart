import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/model/trustee.dart';

class EditTrustee extends StatelessWidget {
  EditTrustee({Key? key, this.trustee}) : super(key: key);

  Trustee? trustee;

  final _nameEditController = TextEditingController();
  final _designationEditController = TextEditingController();
  final _contactEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                hintText: 'Enter Your Name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _designationEditController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Name',
                hintText: 'Enter Your Name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _contactEditController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Name',
                hintText: 'Enter Your Name',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Save'))
          ],
        ),
      ),
    );
  }
}
