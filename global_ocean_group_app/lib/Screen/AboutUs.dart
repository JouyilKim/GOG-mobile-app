import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();

//  Locations
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-36.8507299, 174.7647406),
    zoom: 15.5,
  );
  static final CameraPosition _kLake = CameraPosition(
      bearing: 90,
      target: LatLng(-36.8507677, 174.7651826),
      tilt: 48,
      zoom: 18);

  @override
  Widget build(BuildContext context) {
    LatLng pinPosition = LatLng(-36.850621, 174.764910);
    return Scaffold(
        body: Center(
            child: Container(
          margin: EdgeInsets.fromLTRB(0, 40, 0, 30),
          height: 600,
          child: GoogleMap(
            markers: _markers,
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              setState(() {
                _markers.add(Marker(
                  markerId: MarkerId('<MARKER_ID>'),
                  position: pinPosition,
                ));
              });
            },
          ),
        )),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _goToTheLake,
          label: Text('Zoom'),
          icon: Icon(Icons.map),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked);
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
