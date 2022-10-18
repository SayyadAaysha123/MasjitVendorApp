import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
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
  static const kGoogleApiKey = "AIzaSyDmKx2C1OIAxNzTeoxEH1U8getJT3hTQF4";
  final Map<String, Marker> _markers = {};
  bool locationCaputed = false;
  String _address = '';
  late Placemark address;
  late Place place;
  double selectLat = 0.0;
  double selectLang = 0.0;

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
        ),
        getSearchBarLayout()
      ]),
    );
  }

  Widget getSearchBarLayout() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
      child: Container(
        height: 45,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Image(
                image: AssetImage("assets/images/search.png"),
                // fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 1),
                child: GestureDetector(
                  onTap: () async {
                    _handlePressButton();
                  },
                  child: const Text(
                    "Search Location",
                    style: TextStyle(
                      fontFamily: "Roboto_Regular",
                      fontSize: 15,
                      color: Colors.black38,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onError(PlacesAutocompleteResponse response) {}

  Future<void> _handlePressButton() async {
    // show input autocomplete with selected mode
    // then get the Prediction selected
    Prediction? p = await PlacesAutocomplete.show(
      context: context,
      mode: Mode.overlay,
      apiKey: kGoogleApiKey,
      offset: 0,
      radius: 1000,
      types: [],
      strictbounds: false,
      components: [],
    );

    displayPrediction(p);
    setState(
      () {
        // address = '${p!.description}';
        // _textFullAddress.text = address;
      },
    );
  }

  Future<Null> displayPrediction(Prediction? p) async {
    if (p != null) {
      GoogleMapsPlaces _places = GoogleMapsPlaces(
        apiKey: kGoogleApiKey,
        apiHeaders: await GoogleApiHeaders().getHeaders(),
      );

      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId!);

      double lat = detail.result.geometry!.location.lat;
      double lng = detail.result.geometry!.location.lng;

      selectLang = double.parse('$lng');
      selectLat = double.parse('$lat');

      setState(() {
        _controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(selectLat, selectLang), zoom: 18),
          ),
        );
        // _initialCameraPosition = LatLng(selectLat, selectLang);
        // _createMarker();
      });
    }
  }
}
