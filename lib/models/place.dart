import 'dart:io';

import 'location.dart';

class Place {
  static const idKey = 'id';
  static const ttlKey = 'title';
  static const locKey = 'location';
  static const imgKey = 'image';

  const Place({
    required this.id,
    required this.title,
    required this.location,
    required this.image,
  });

  Place.fromStorableMap(Map<String, dynamic> map)
      : this(
          id: map[idKey],
          title: map[ttlKey],
          location: const Location(lat: 0.0, lng: 0.0),
          image: File(map[imgKey]),
        );

  final String id;
  final String title;
  final Location location;
  final File image;

  Map<String, dynamic> toStorableMap() {
    return {idKey: id, ttlKey: title, imgKey: image.path};
  }
}
