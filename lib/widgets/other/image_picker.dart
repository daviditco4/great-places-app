import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart' as picker;

class ImagePicker extends StatefulWidget {
  const ImagePicker({required this.pickImgCallback, required this.paddingVal});
  final void Function(File) pickImgCallback;
  final double paddingVal;
  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  File? _image;

  Future<void> _pickImage({required picker.ImageSource source}) async {
    final imagePicker = picker.ImagePicker();
    final image = await imagePicker.pickImage(source: source, maxWidth: 1080.0);

    if (image != null) {
      setState(() => _image = File(image.path));
      widget.pickImgCallback(_image!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150.0,
          height: 100.0,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/image_picker_placeholder.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              alignment: _image != null ? null : Alignment.center,
              child: _image == null
                  ? const Text('No Image Selected', textAlign: TextAlign.center)
                  : Image.file(_image!, fit: BoxFit.contain),
            ),
          ),
        ),
        SizedBox(width: widget.paddingVal),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.camera),
              label: const Text('Take Picture'),
              onPressed: () => _pickImage(source: picker.ImageSource.camera),
            ),
            TextButton.icon(
              icon: const Icon(Icons.photo_library),
              label: const Text('Choose From Gallery'),
              onPressed: () => _pickImage(source: picker.ImageSource.gallery),
            ),
          ],
        ),
      ],
    );
  }
}
