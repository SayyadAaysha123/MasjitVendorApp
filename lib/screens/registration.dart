import 'dart:io';
import 'package:flutter/cupertino.dart';
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
  Place? address;
  File? _image;
  final _imagess= [];
  var img;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController masjidNameController = TextEditingController();
  TextEditingController imamNameController = TextEditingController();
  TextEditingController imamNumberController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  var res;
  //Sangharsh
   PickedFile? _imageFile;
  final ImagePicker _picker1 = ImagePicker();



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
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: address?.subLocality,
                                style:
                                    TextStyle(fontSize: 9, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: ' City : ',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: address?.locality,
                                style:
                                    TextStyle(fontSize: 9, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: ' Postal Code : ',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: address?.postalCode,
                                style:
                                    TextStyle(fontSize: 9, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: ' Administrative Area : ',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: address?.administrativeArea,
                                style:
                                    TextStyle(fontSize: 9, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: ' Country : ',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: address?.country,
                                style:
                                    TextStyle(fontSize: 9, color: Colors.black),
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
                _pickImage1();
               /* Future<List<XFile>?> images = _picker.pickMultiImage();

                images.then((value) {
                  if (value == null) return;
                  _images.addAll(value);
                  print(images);
                });*/

                // _imagess.length < 3 ?
                // // /*_imaGallery()*/ _pickImage():
                // ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(content: Text("You have only maximum 3 images uploaded")));


              },
              child: const Text(
                'Select Images',
              ),
            ),


            Padding(
              padding: EdgeInsets.only(left: 10, top: 7),
              child: GestureDetector(
                onDoubleTap: (){},
                onTap: (){
                  _pickImage1();
                  print("imgpath---> ${img.toString()}");
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                  ),
                  child: _imageFile!=null?
                  Image.file(File(_imageFile!.path),
                    fit: BoxFit.cover,) : Container(),
                ),
              ),
            ),

           /* Row(
              children: [
                for (int i = 0; i < _imagess.length; i++)
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Row(
                      children: [


                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 7),
                          child: GestureDetector(
                            onDoubleTap: (){},
                            onTap: (){
                              print("imgpath---> ${_imagess[i].toString()}");
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                            },
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.red,
                              ),
                              child: _imagess!=null?
                              Image.file(_imagess[i]!,
                              fit: BoxFit.cover,) : Container(),
                            ),
                          ),
                        ),




                      ],
                    ),
                  ),
              ],
            ),*/

            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async{



                print("Hi");
                if (address == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please Select Location")));
                  return;
                }


                // uploadImage(img.path);

                var resutl = _pickImage1();

                resutl.then((value) {
                  value.data?.token;

                  var box = Hive.box("testBox");

                  box.put(kToken, value.data?.token);
                  box.put(kMasjid, value.data?.masjid?.toJson());

                  print(" registrationToken ${box.get("token")}");

                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
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


  _imaGallery()async{
    // PickedFile? pickedImage = await ImagePicker()
    //     .getImage(source: ImageSource.gallery,
    // imageQuality: 50);
    // setState(() {
    //    _imagess.add(File(pickedImage!.path));
    //   File? picked =File(pickedImage.path);
    //   List<int> imageBytes = picked.readAsBytesSync();
    //   img = pickedImage.path;
    //   // uploadImage(pickedImage.path);
    //   // img = base64Encode(imageBytes);
    //
    //
    // });
  }




  // void _pickImage() async {
  //   try {
  //     final pickedFile = await _picker.getImage(source: ImageSource.gallery);
  //     setState(() async {
  //       _imagess.add(File(pickedFile!.path));
  //
  //       img = File(pickedFile.path);
  //
  //     });
  //   } catch (e) {
  //     print("Image picker error " + e.toString());
  //   }
  // }





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


   _pickImage1() async {
    try {
      final pickedFile1 = await _picker.getImage(source: ImageSource.gallery);
      setState(() async {

        setState(() {
          _imageFile = pickedFile1!;
        });


        var request = http.MultipartRequest('POST', Uri.parse("http://masjid.exportica.in/api/masjid/register"));

        print("======>"+_imageFile!.path.toString());
        request.files.add(await http.MultipartFile.fromPath('images[]', _imageFile!.path.toString()));

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
        print(res.statusCode);
      });
    } catch (e) {
      print("Image picker error ");
    }
  }


  uploadImage (filepath, Uri parse) async {




    //return  registerResponseModelFromJson(res.toString());
  }


}
