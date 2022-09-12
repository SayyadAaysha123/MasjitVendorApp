import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:masjit_vendor_app/data/dio_client.dart';
import 'package:masjit_vendor_app/data/model/place.dart';
import 'package:masjit_vendor_app/screens/get_location.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _form = GlobalKey<FormState>();
  final _images = <XFile>[];
  String _address = '';
  final fields = <String, dynamic>{};
  late Place address;
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
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                label: Text('Email Id'),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                fields['email'] = value;
              },
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
              onChanged: (value) {
                fields['password'] = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                label: Text('Phone No.'),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                fields['phone'] = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                label: Text('Masjid Name'),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                fields['masjid_name'] = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                label: Text('Imam Name'),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                fields['immam_name'] = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                label: Text('Imam Number'),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                fields['immam_contact'] = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {
                Future<Place?> result = Navigator.of(context).push<Place>(
                  MaterialPageRoute(
                    builder: (context) => const GetLocation(),
                  ),
                );

                result.then((value) {
                  if (value == null) return;
                  setState(() {
                    address = value;
                    _address =
                        '${address.street}, ${address.subLocality},\n ${address.locality}, ${address.postalCode},\n ${address.administrativeArea}, ${address.country}';
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
                  _images.addAll(value);

                  var files = [];
                  _images.map((e) => MultipartFile.fromFile(e.path)
                      .then((value) => files.add(value)));

                  fields['images'] = files;
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
                var data = FormData.fromMap({...address.toJson(), ...fields});

                var finalData = DioClient().register(data);
                finalData.then(
                  (value) {
                    if (value.statusCode == 200) {
                      print(value.data);
                    } else {
                      print(value.statusMessage);
                    }
                  },
                ).onError((error, stackTrace) {
                  error = error as DioError;
                  print(error.response);
                });
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
