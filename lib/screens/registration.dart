import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:masjit_vendor_app/data/model/place.dart';
import 'package:masjit_vendor_app/screens/get_location.dart';
import 'package:masjit_vendor_app/screens/home.dart';
import 'package:masjit_vendor_app/screens/login.dart';
import 'package:masjit_vendor_app/utils/constant.dart';
import 'dart:async';
import '../data/model/register.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String _address = '';
  final fields = <String, dynamic>{};
  Place? address;
  final _imagess = [];

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController masjidNameController = TextEditingController();
  TextEditingController imamNameController = TextEditingController();
  TextEditingController imamNumberController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  //Sangharsh
  PickedFile? _imageFile;


  @override
  void initState() {
    super.initState();
  }

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
              controller: emailController,
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
              controller: passwordController,
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
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                label: Text('Masjid Phone No.'),
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
              controller: masjidNameController,
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
              controller: imamNameController,
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
              controller: imamNumberController,
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
              height: 20,
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
                        'Area ${address?.subLocality},\n City ${address?.locality}, \n Postal Code ${address?.postalCode},\n State ${address?.administrativeArea}, \n Country ${address?.country}';
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
            _address.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: ' Area : ',
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: address?.subLocality,
                                style:
                                    const TextStyle(fontSize: 9, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: ' City : ',
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: address?.locality,
                                style:
                                    const TextStyle(fontSize: 9, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: ' Postal Code : ',
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: address?.postalCode,
                                style:
                                    const TextStyle(fontSize: 9, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: ' Administrative Area : ',
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: address?.administrativeArea,
                                style:
                                    const TextStyle(fontSize: 9, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: ' Country : ',
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: address?.country,
                                style:
                                    const TextStyle(fontSize: 9, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {
                print(_imagess.length);

                setState(() {
                  _imagess.length < 3
                      ? _pickImage()
                      : ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text("You have only maximum 3 images uploaded")));
                });
              },
              child: const Text(
                'Select Images',
              ),
            ),
            Row(
              children: [
                for (int i = 0; i < _imagess.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 7),
                          child: GestureDetector(
                            onDoubleTap: () {},
                            onTap: () {
                              print("imgpath---> ${_imagess[i].toString()}");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginScreen()));
                            },
                            child: Container(
                              height: 70,
                              width: 70,
                              child: _imageFile != null
                                  ? Image.file(
                                      _imagess[i],
                                      fit: BoxFit.cover,
                                    )
                                  : Container(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                print("Hi");
                if (address == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please Select Location")));
                  return;
                }

                // uploadImage(img.path);

                var resutl = _pickImage1();

                resutl.then((value) {
                  value?.data?.token;

                  var box = Hive.box("testBox");

                  box.put(kToken, value?.data?.token);
                  box.put(kMasjid, value?.data?.masjid?.toJson());

                  print(" registrationToken ${box.get("token")}");

                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const Home()));
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

  PickedFile? pickedFile1;

  void _pickImage() async {
    try {
      pickedFile1 = await _picker.getImage(source: ImageSource.gallery);
      setState(() {
        _imageFile = pickedFile1!;
        _imagess.add(File(_imageFile!.path));
      });
    } catch (e) {
      print("Image picker error " + e.toString());
    }
  }

  // Future<RegisterResponseModel> getRegisterVendors() async {
  //
  //   try {
  //     final result = await http.post(
  //         Uri.parse("http://masjid.exportica.in/api/masjid/register"),
  //
  //
  //         body: {
  //           "email": emailController.text.trim(),
  //           "password": phoneNumberController.text.trim(),
  //           "immam_name": imamNameController.text.trim(),
  //           "masjid_name": masjidNameController.text.trim(),
  //           "immam_contact": imamNumberController.text.trim(),
  //           "lat": address?.lat,
  //           "long": address?.long,
  //           "phone": phoneNumberController.text.trim(),
  //           "street": address?.street,
  //           "sub_locality": address?.subLocality,
  //           "locality": address?.locality,
  //           "postal_code": address?.postalCode,
  //           "administrative_area": address?.administrativeArea,
  //           "country": address?.country,
  //           "images": img.toString()
  //         });
  //
  //     if(result.statusCode == 200){
  //       print("Hii ${result.body}");
  //     }
  //
  //
  //     return registerResponseModelFromJson(result.body);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  Future<RegisterResponseModel?> _pickImage1() async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse("http://masjid.exportica.in/api/masjid/register"));

      print("======>" + _imageFile!.path.toString());
      request.files.add(await http.MultipartFile.fromPath(
          'images[]', _imageFile!.path.toString()));

      request.fields.addAll({
        "email": emailController.text.trim(),
        "password": phoneNumberController.text.trim(),
        "immam_name": imamNameController.text.trim(),
        "masjid_name": masjidNameController.text.trim(),
        "immam_contact": imamNumberController.text.trim(),
        "lat": address!.lat!,
        "long": address!.long!,
        "phone": phoneNumberController.text.trim(),
        "street": address!.street!,
        "sub_locality": address!.subLocality!,
        "locality": address!.locality!,
        "postal_code": address!.postalCode!,
        "administrative_area": address!.administrativeArea!,
        "country": address!.country!,
      });

      var res = await request.send();

      var get = await res.stream.bytesToString();
      print(get);

      return registerResponseModelFromJson(get);
    } catch (e) {
      print("Image picker error ");
    }
  }
}
