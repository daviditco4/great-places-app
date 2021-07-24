import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../helpers/google_maps.dart';
import '../models/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({
    required this.selectingEnabled,
    this.initialTargetLocation = const Location(lat: 37.4221, lng: -122.0841),
  });
  final bool selectingEnabled;
  final Location initialTargetLocation;
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng? _selectedLatLng;

  void _popSelectedLocation() {
    Navigator.of(context).pop(Location.fromLatLng(_selectedLatLng!));
  }

  @override
  Widget build(BuildContext context) {
    final slctEnabled = widget.selectingEnabled;
    final initialLatLng = widget.initialTargetLocation.toLatLng();
    const markerId = MarkerId('m');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
        actions: [
          if (slctEnabled)
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: _selectedLatLng == null ? null : _popSelectedLocation,
            ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: initialLatLng,
          zoom: GoogleMaps.defaultZoom,
        ),
        onTap: slctEnabled ? (l) => setState(() => _selectedLatLng = l) : null,
        markers: slctEnabled
            ? {
                if (_selectedLatLng != null)
                  Marker(markerId: markerId, position: _selectedLatLng!),
              }
            : {Marker(markerId: markerId, position: initialLatLng)},
        myLocationEnabled: true,
      ),
    );
  }
}
