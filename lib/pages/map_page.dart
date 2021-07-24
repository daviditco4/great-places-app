import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../helpers/google_maps.dart';
import '../models/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({this.initLoc = const Location(lat: 37.4221, lng: -122.0841)});
  final Location initLoc;
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Map')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: widget.initLoc.toLatLng(),
          zoom: GoogleMaps.defaultZoom,
        ),
        myLocationEnabled: true,
      ),
    );
  }
}
