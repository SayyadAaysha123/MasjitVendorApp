import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as location;
import 'package:masjit_vendor_app/data/model/place.dart';

class GetLocation extends StatefulWidget {
  const GetLocation({Key? key}) : super(key: key);

  @override
  State<GetLocation> createState() => GetLocationState();
}

class GetLocationState extends State<GetLocation> {
  late GoogleMapController _controller;
  final location.Location _location = location.Location();
  Timer? _debounce;

  final Map<String, Marker> _markers = {};
  bool locationCaputed = false;
  String _address = '';
  late Placemark address;
  late Place place;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(18.563072, 73.8000896),
    zoom: 12,
  );

  @override
  void initState() {
    super.initState();
  }

  _updateAddress(LatLng target) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 800), () {
      Future<List<Placemark>> placemarks = placemarkFromCoordinates(
        target.latitude,
        target.longitude,
      );

      placemarks.then(
        (value) {
          address = value[0];
          _address =
              '${address.name}, ${address.street}, ${address.subLocality}, ${address.locality}, ${address.postalCode}, ${address.administrativeArea}, ${address.country}';

          place = Place(
            administrativeArea: address.administrativeArea,
            street: address.street,
            lat: target.latitude.toString(),
            long: target.longitude.toString(),
            locality: address.locality,
            subLocality: address.subLocality,
            country: address.country,
            postalCode: address.postalCode,
          );
          setState(() {});
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            markers: _markers.values.toSet(),
            onCameraMove: (position) {
              _updateAddress(position.target);
              setState(() {
                _markers.clear();
                _markers['location'] = Marker(
                  markerId: const MarkerId('location'),
                  position: position.target,
                );
              });
            },
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
              _location.onLocationChanged.listen((location) async {
                if (locationCaputed) return;

                locationCaputed = true;

                final latLng = LatLng(
                  location.latitude!,
                  location.longitude!,
                );

                _markers.clear();
                _controller.moveCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: latLng,
                      zoom: 15.0,
                    ),
                  ),
                );

                _updateAddress(latLng);

                setState(() {
                  _markers['location'] = Marker(
                    markerId: const MarkerId('location'),
                    position: latLng,
                  );
                });
              });
            }),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .7,
            height: MediaQuery.of(context).size.height * .2,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_address),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(place);
                    },
                    child: const Text('Save Address'),
                  )
                ]),
          ),
        )
      ]),
    );
  }
}
