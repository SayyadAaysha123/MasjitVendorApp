import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import 'package:masjit_vendor_app/screens/get_location.dart';
import 'package:masjit_vendor_app/screens/home.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _form = GlobalKey<FormState>();
  String _address = '';
  late Placemark address;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Email Id'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                label: Text('Password'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Phone No.'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Masjid Name'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Imam Name'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Imam Number'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {
                Future<Placemark?> result =
                    Navigator.of(context).push<Placemark>(
                  MaterialPageRoute(
                    builder: (context) => const GetLocation(),
                  ),
                );

                result.then((value) {
                  if (value == null) return;
                  setState(() {
                    address = value;
                    _address =
                        '${address.name}, ${address.street}, ${address.subLocality},\n ${address.locality}, ${address.postalCode},\n ${address.administrativeArea}, ${address.country}';
                    setState(() {});
                  });
                });
              },
              child: const Text(
                'Select Location',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _address.isNotEmpty ? Text(_address) : const SizedBox.shrink(),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {
                Future<List<XFile>?> images = _picker.pickMultiImage();
                images.then((value) {
                  if (value == null) return;
                });
              },
              child: const Text(
                'Select Images',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              },
              child: const Text(
                'Register',
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
