import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:masjit_vendor_app/data/model/SharePreferenceClass.dart';
import 'package:masjit_vendor_app/data/model/delete_image_response.dart';
import 'package:masjit_vendor_app/data/model/masjid_profile_response_model.dart';
import 'package:masjit_vendor_app/data/model/place.dart';
import 'package:masjit_vendor_app/data/model/update_profile_response.dart';
import 'package:masjit_vendor_app/screens/get_location.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // TextEditingController phoneNumberController = TextEditingController();
  TextEditingController masjidNameController = TextEditingController();
  TextEditingController imamNameController = TextEditingController();
  TextEditingController imamNumberController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  String _address = '';
  final fields = <String, dynamic>{};
  Place? address;
  final pickedFiles = <PickedFile>[];
  final imageList = <String>[];

  final ImagePicker _picker = ImagePicker();

  var sub_locatilty;
  var locatilty;
  var postal_code;
  var administrative_area;
  var country;
  var lat;
  var long;
  var street;

  //Sangharsh
  // PickedFile? _imageFile;
  PickedFile? pickedFile1;

  @override
  void initState() {
    super.initState();
    if (mounted)
      setState(() {
        getUserProfile();
      });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(children: [
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  label: Text('Email Id'),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email address';
                  }
                  // Check if the entered email has the right format
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  // Return null if the entered email is valid
                  return null;
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
                /*  validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'This field is required';
                  }
                  if (value.trim().length < 6) {
                    return 'Password must be at least 6 characters in length';
                  }
                  // Return null if the entered password is valid
                  return null;
                },*/
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Visibility(
                      visible:
                          passwordController.text.isNotEmpty ? false : true,
                      child: Text(
                        " Leave blank for no change add password if you have update it.",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // TextFormField(
              //   controller: niph,
              //   keyboardType: TextInputType.phone,
              //   decoration: const InputDecoration(
              //     label: Text('Masjid Phone No.'),
              //     border: OutlineInputBorder(),
              //   ),
              //   validator: (value) {
              //     if (value == null || value.trim().isEmpty) {
              //       return 'This field is required';
              //     }
              //     if (value.trim().length < 10 || value.trim().length > 10) {
              //       return 'Please Enter Valid Number';
              //     }
              //     // Return null if the entered password is valid
              //     return null;
              //   },
              // ),
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
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter Masjid Name address';
                  }
                  return null;
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
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter Imam Name address';
                  }
                  return null;
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
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'This field is required';
                  }
                  if (value.trim().length < 10 || value.trim().length > 10) {
                    return 'Please Enter Valid Number';
                  }
                  // Return null if the entered password is valid
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: locationController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  label: Text('Masjid Location'),
                  border: OutlineInputBorder(),
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: GestureDetector(
                      onTap: () {
                        Future<Place?> result =
                            Navigator.of(context).push<Place>(
                          MaterialPageRoute(
                            builder: (context) => const GetLocation(),
                          ),
                        );

                        result.then((value) {
                          if (value == null) return;
                          setState(() {
                            address = value;
                            _address  =
                                "${address?.subLocality}, ${address?.locality}, ${address?.postalCode}, ${address?.administrativeArea}, ${address?.country}";
                            locationController.text = _address;
                            setState(() {});
                          });
                        });
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Icon(
                          Icons.edit_location_alt_sharp,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
              ),
              /*OutlinedButton(
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
              ),*/
              const SizedBox(
                height: 10,
              ),
              /*_address.isNotEmpty
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
                                  style: const TextStyle(
                                      fontSize: 9, color: Colors.black),
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
                                  style: const TextStyle(
                                      fontSize: 9, color: Colors.black),
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
                                  style: const TextStyle(
                                      fontSize: 9, color: Colors.black),
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
                                  style: const TextStyle(
                                      fontSize: 9, color: Colors.black),
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
                                  style: const TextStyle(
                                      fontSize: 9, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),*/
              const SizedBox(
                height: 10,
              ),
              OutlinedButton(
                onPressed: () {
                  print(pickedFiles.length);

                  setState(() {
                    imageList.length < 3
                        ? _pickImage()
                        : ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("You can upload only 3 Images")));
                  });
                },
                child: const Text(
                  'Select Images',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < imageList.length; i++)
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          height: 87,
                          width: 77,
                          // color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Row(
                              children: [
                                imageList.isNotEmpty?  Container(
                                    height: 70,
                                    width: 70,
                                    child: imageList[i].contains('http')
                                        ? Image.network(
                                            imageList[i],
                                          )
                                        : Image.file(File(imageList[i]))): Container(),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {

                            /*if(imageList[i].contains('http')){
                              print(imageList[i].toString().replaceAll("http://admin.azan4salah.com", ""));
                            }
                            else{
                              print(imageList[i].toString().replaceAll("/data/user/0/com.azanforsalah.masjid/cache", ""));
                            }*/


                            print(imageList[i].toString().replaceAll("http://admin.azan4salah.com", ""));


                           postDeleteImage(imageList[i].toString().replaceAll("http://admin.azan4salah.com", ""));

                            imageList.removeAt(i);

                            setState(() {});
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Icon(
                              Icons.cancel_sharp,
                              color: Colors.red,
                              size: 17,
                            ),
                          ),
                        )
                      ],
                    ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                color: Colors.transparent,
                width: 100,
                height: 40,
                child: ElevatedButton(
                  onPressed: () async {
                    imageList.isNotEmpty?
                    updateProfile():
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please select one image.")));;
                  },
                  child: const Text(
                    'Update',
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void _pickImage() async {
    try {
      pickedFile1 = await _picker.getImage(source: ImageSource.gallery);
      setState(() {
        pickedFiles.add(pickedFile1!);
        imageList.add(pickedFile1!.path.toString());
      });
    } catch (e) {
      print("Image picker error " + e.toString());
    }
  }

  Future<MasjidProfileResponseModel> getUserProfile() async {
    String? token = await AppPreferences.getToken();
    String? id = await AppPreferences.getIds();
    print(token);

    try {
      var headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };

      final result = await http.get(
        Uri.parse("http://admin.azan4salah.com/api/masjids/get/$id"),
        headers: headers,
      );

      if (result.statusCode == 200) {
        print("${result.body}");

        var jsonResponse = jsonDecode(result.body);

        print('Hiiii ${jsonResponse["data"]["immam"]["email"]}');

        if (mounted) {
          setState(() {
            emailController.text = jsonResponse["data"]["immam"]["email"] ?? '';
            masjidNameController.text =
                jsonResponse["data"]["masjid_name"] ?? '';
            imamNameController.text =
                jsonResponse["data"]["immam"]["name"] ?? '';
            imamNumberController.text =
                jsonResponse["data"]["immam"]["phone"] ?? '';
            locationController.text = jsonResponse["data"]["sub_locality"] +
                    ", " +
                    jsonResponse["data"]["locality"] +
                    ", " +
                    jsonResponse["data"]["postal_code"] +
                    ", " +
                    jsonResponse["data"]["administrative_area"] +
                    ", " +
                    jsonResponse["data"]["country"] ??
                '';


            sub_locatilty = jsonResponse["data"]["sub_locality"];
            locatilty = jsonResponse["data"]["locality"];
            postal_code =  jsonResponse["data"]["postal_code"];
            administrative_area = jsonResponse["data"]["administrative_area"];
            country = jsonResponse["data"]["country"];
            lat =  jsonResponse["data"]["lat"];
            long =  jsonResponse["data"]["long"];
            street =  jsonResponse["data"]["street"];

            print("check ${sub_locatilty} ${lat} ${locatilty} ${postal_code}");

            print(
                "img ${"http://admin.azan4salah.com${jsonResponse["data"]["images"][0]}"}");
            for (int i = 0;
                i < (jsonResponse["data"]["images"].length ?? 0);
                i++) {
              imageList.add(
                  "http://admin.azan4salah.com${jsonResponse["data"]["images"][i]}");
              print(
                  "http://admin.azan4salah.com${jsonResponse["data"]["images"][i]}");
            }
            setState(() {});
          });
        }
      }

      return masjidProfileResponseModelFromJson(result.body);
    } catch (e) {
      throw e;
    }
  }

  Future<UpdateMasjidProfileResponseModel?> updateProfile() async {
    String? token = await AppPreferences.getToken();
    String? id = await AppPreferences.getIds();

    try {
      var request = http.MultipartRequest('POST',
          Uri.parse("http://admin.azan4salah.com/api/masjids/update-masjid"));

      for (int i = 0; i < pickedFiles.length; i++) {
        request.files.add(
            await http.MultipartFile.fromPath('images[]', pickedFiles[i].path));
        print("tester---->${pickedFiles[i].path.toString()}");
      }

      final fields = {
        "id": id.toString(),
        "masjid_name": masjidNameController.text.trim(),
        "name": imamNameController.text.trim(),
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
        "phone": imamNumberController.text.trim(),
        "password": passwordController.text.trim(),
        "street": _address.isNotEmpty ? address!.street.toString() : street.toString(),
        "sub_locality":
        _address.isNotEmpty ? address!.subLocality.toString() : sub_locatilty.toString(),
        "locality": _address.isNotEmpty ? address!.locality.toString() : locatilty.toString(),
        "postal_code":
        _address.isNotEmpty ? address!.postalCode.toString() : postal_code.toString(),
        "administrative_area": _address.isNotEmpty
            ? address!.administrativeArea.toString()
            : administrative_area.toString(),
        "country": _address.isNotEmpty ? address!.country.toString() : country.toString(),
        "lat": _address.isNotEmpty ? address!.lat.toString() : lat.toString(),
        "long": _address.isNotEmpty ? address!.long.toString() : long.toString() ,
      };

      print("register  $fields");
      request.fields.addAll(fields);
      request.headers.addAll({'accept': 'application/json',
        'Authorization': 'Bearer $token'});

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        var jsonData = json.decode(value);

        print(jsonData);

        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Profile Updated Successfully.")));

        /* if (response.statusCode == 422) {
          Map<String, dynamic> body = jsonDecode(value);
          Map<String, dynamic> error = body['errors'];

          for (var et in error.entries) {
            print('${et.key}, ${et.value[0]}');
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("${et.value[0]}")));
          }

          return;
        }*/

        /* AppPreferences.setToken(jsonData["data"]["token"]);
        AppPreferences.setMasjid(json.encode(jsonData["data"]["masjid"]));
        AppPreferences.setIds(json.encode(jsonData["data"]["masjid"]["id"]));*/

        AppPreferences.setMasjidName(masjidNameController.text.trim());

        // print(
        //     "imagesssss ${json.encode(jsonData["data"]["masjid"]["place"]["masjid_name"])}");
      });
    } catch (e) {
      print(e);
    }
  }


  Future<List>postDeleteImage(String path) async {

    String? token = await AppPreferences.getToken();

    try {

      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };

      final result = await http
          .post(Uri.parse("http://admin.azan4salah.com/api/delete-photo"),
          headers: headers,
          body: {

            "key": path.toString(),


          });

      print("response body" + result.body);

      if(result.statusCode == 200){

        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //     content: Text("Request sent Successfully.")));

      }

      return deleteImageResponseFromJson(result.body);
    } catch (e) {
      rethrow;
    }
  }


}
