import 'package:flutter/material.dart';
import 'package:location/location.dart' as gps;

import '../../helpers/google_maps.dart';
import '../../models/location.dart';
import '../../pages/map_page.dart';

class LocationPicker extends StatefulWidget {
  const LocationPicker({required this.paddingValue});
  final double paddingValue;
  @override
  _LocationPickerState createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  String? _locationMapImageUrl;

  Future<void> _getUserLocation() async {
    final locationData = await gps.Location().getLocation();

    if (locationData.latitude != null && locationData.longitude != null) {
      final staticMapImageUrl = GoogleMaps.getStaticImageUrlInCoordinates(
        locationData.latitude!,
        locationData.longitude!,
      );
      setState(() => _locationMapImageUrl = staticMapImageUrl);
    }
  }

  Future<void> _searchMapLocation() async {
    final mapLocation = await Navigator.of(context).push<Location>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => const MapPage(selectingEnabled: true),
      ),
    );
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
