import 'package:flutter/material.dart';

import '../../widgets/other/image_picker.dart';

class AddPlacePage extends StatefulWidget {
  static const routeName = 'add-place';
  @override
  _AddPlacePageState createState() => _AddPlacePageState();
}

class _AddPlacePageState extends State<AddPlacePage> {
  final _titleController = TextEditingController();

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
              const ImagePicker(paddingValue: paddingValue),
              verticalSpace,
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton.icon(
          icon: const Icon(Icons.add),
          label: const Text('Add Place'),
          onPressed: () {},
        ),
      ],
    );
  }
}
