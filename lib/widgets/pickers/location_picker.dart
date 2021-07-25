import 'package:flutter/material.dart';
import 'package:location/location.dart' as gps;

import '../../helpers/google_maps.dart';
import '../../models/location.dart';
import '../../pages/map_page.dart';

class LocationPicker extends StatefulWidget {
  const LocationPicker({
    required this.pickLocationCallback,
    required this.getPickedLocationCallback,
    required this.paddingValue,
  });

  final void Function(Location) pickLocationCallback;
  final Location? Function() getPickedLocationCallback;
  final double paddingValue;

  @override
  _LocationPickerState createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  String? _locationMapImageUrl;

  Future<void> _getUserLocation() async {
    try {
      final locationData = await gps.Location().getLocation();

      if (locationData.latitude != null && locationData.longitude != null) {
        final latitude = locationData.latitude!;
        final longitude = locationData.longitude!;
        _getLocationMapImageUrl(latitude, longitude);
        widget.pickLocationCallback(Location(lat: latitude, lng: longitude));
      }
    } on Exception catch (_) {
      return;
    }
  }

  Future<void> _searchMapLocation() async {
    final mapLocation = await Navigator.of(context).push<Location>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) {
          final locatn = widget.getPickedLocationCallback();
          return MapPage(selectingEnabled: true, initialTargetLocation: locatn);
        },
      ),
    );

    if (mapLocation != null) {
      _getLocationMapImageUrl(mapLocation.lat, mapLocation.lng);
      widget.pickLocationCallback(mapLocation);
    }
  }

  void _getLocationMapImageUrl(double lat, double lng) {
    final staticMapImgUrl = GoogleMaps.getStaticImageUrlInCoordinates(lat, lng);
    setState(() => _locationMapImageUrl = staticMapImgUrl);
  }

  @override
  Widget build(BuildContext context) {
    final space = SizedBox.fromSize(size: Size.square(widget.paddingValue));

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          height: 200.0,
          child: Center(
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              alignment: _locationMapImageUrl != null ? null : Alignment.center,
              child: _locationMapImageUrl == null
                  ? const Text(
                      'No Location Selected',
                      style: TextStyle(color: Colors.grey, fontSize: 20.0),
                      textAlign: TextAlign.center,
                    )
                  : Image.network(
                      _locationMapImageUrl!,
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.none,
                    ),
            ),
          ),
        ),
        space,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.location_on),
              label: const Text('Use My Location'),
              onPressed: _getUserLocation,
            ),
            space,
            TextButton.icon(
              icon: const Icon(Icons.map),
              label: const Text('Search In The Map'),
              onPressed: _searchMapLocation,
            ),
          ],
        ),
      ],
    );
  }
}
