import 'dart:io';

import 'package:flutter/material.dart';

class ImagePicker extends StatefulWidget {
  const ImagePicker({required this.paddingValue});
  final double paddingValue;
  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  File? _img;

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
              alignment: _img != null ? null : Alignment.center,
              child: _img == null
                  ? const Text('No Image Selected', textAlign: TextAlign.center)
                  : Image.file(_img!,
                      width: double.infinity, fit: BoxFit.contain),
            ),
          ),
        ),
        SizedBox(width: widget.paddingValue),
        TextButton.icon(
          icon: const Icon(Icons.camera),
          label: const Text('Take Picture'),
          onPressed: () {},
        ),
      ],
    );
  }
}
