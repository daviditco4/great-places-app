import 'dart:io';

import 'location.dart';

class Place {
  static const idKey = 'id';
  static const ttlKey = 'title';
  static const latKey = 'latitude';
  static const lngKey = 'longitude';
  static const adrKey = 'address';
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
          location: Location(
            lat: map[latKey] as double,
            lng: map[lngKey] as double,
            addr: map[adrKey],
          ),
          image: File(map[imgKey]),
        );

  final String id, title;
  final Location location;
  final File image;

  Map<String, dynamic> toStorableMap() {
    return {
      idKey: id,
      ttlKey: title,
      latKey: location.lat,
      lngKey: location.lng,
      adrKey: location.addr,
      imgKey: image.path,
    };
  }
}
