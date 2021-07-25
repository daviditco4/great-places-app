import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/location.dart';
import '../models/places.dart';
import '../widgets/pickers/image_picker.dart';
import '../widgets/pickers/location_picker.dart';

class AddPlacePage extends StatefulWidget {
  static const routeName = 'add-place';
  @override
  _AddPlacePageState createState() => _AddPlacePageState();
}

class _AddPlacePageState extends State<AddPlacePage> {
  final _titleController = TextEditingController();
  File? _pickedImage;
  Location? _pickedLocation;
  Location? _pickedLoc() => _pickedLocation?.copyWith(_pickedLocation?.addr);
  void _getImage(File image) => _pickedImage = image;
  void _getPickedLocation(Location location) => _pickedLocation = location;

  Future<void> _submit() async {
    final ttl = _titleController.text.trim();

    if (ttl.isNotEmpty && _pickedImage != null && _pickedLocation != null) {
      Provider.of<Places>(context, listen: false).add(
        title: ttl,
        image: _pickedImage!,
        loc: _pickedLocation!,
      );
      Navigator.of(context).pop();
    } else {
      await showDialog<Null>(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Incomplete Place'),
            content: const Text('Please fill the entire form.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const paddingValue = 12.0;
    const verticalSpace = SizedBox(height: paddingValue);

    return Scaffold(
      appBar: AppBar(title: const Text('New Place')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(paddingValue),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              verticalSpace,
              ImagePicker(pickImgCallback: _getImage, paddingVal: paddingValue),
              verticalSpace,
              LocationPicker(
                pickLocationCallback: _getPickedLocation,
                getPickedLocationCallback: _pickedLoc,
                paddingValue: paddingValue,
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton.icon(
          icon: const Icon(Icons.add),
          label: const Text('Add Place'),
          onPressed: _submit,
        ),
      ],
    );
  }
}
