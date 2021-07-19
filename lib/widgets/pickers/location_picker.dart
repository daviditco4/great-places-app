import 'package:flutter/material.dart';

class LocationPicker extends StatefulWidget {
  const LocationPicker({required this.paddingValue});
  final double paddingValue;
  @override
  _LocationPickerState createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  String? _locationMapImageUrl;

  @override
  Widget build(BuildContext context) {
    final space = SizedBox.fromSize(size: Size.square(widget.paddingValue));

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          height: 200.0,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          alignment: Alignment.center,
          child: _locationMapImageUrl == null
              ? const Text(
                  'No Location Selected',
                  style: TextStyle(color: Colors.grey, fontSize: 20.0),
                  textAlign: TextAlign.center,
                )
              : Image.network(_locationMapImageUrl!, fit: BoxFit.cover),
        ),
        space,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.location_on),
              label: const Text('Use My Location'),
              onPressed: () {},
            ),
            space,
            TextButton.icon(
              icon: const Icon(Icons.map),
              label: const Text('Search In The Map'),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
