import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:global_ocean_group_app/Localization/app_localizations.dart';

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
    Locale myLocale = Localizations.localeOf(context);

    LatLng pinPosition = LatLng(-36.850621, 174.764910);
    return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child:Image.asset("images/home.png",width:50, height: 50,)
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    ),
                    Flexible(
                      child: Text("L12 290 Queen Street, Auckland 1010, New Zealand"),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Image.asset("images/contactus.png",width: 40,height: 40,),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    ),
                    Text("  +64-93032555")
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("images/email.png",width: 60,height: 60,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    ),
                    Text(" info.globalocean@gmail.com")
                  ],
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 30),
                  height: 600,
                  child: GoogleMap(
                    //this is the code for map gesture move in the scroll view
                    gestureRecognizers: Set()
                      ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
                      ..add(Factory<VerticalDragGestureRecognizer>(
                              () => VerticalDragGestureRecognizer())),
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
                ),
              ],
            )
          ),
        ),
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
