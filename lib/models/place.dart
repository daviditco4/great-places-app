import 'dart:io';

import 'location.dart';

class Place {
  final String id;
  final String title;
  final Location location;
  final File image;

  const Place({
    required this.id,
    required this.title,
    required this.location,
    required this.image,
  });
}
