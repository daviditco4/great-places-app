import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../helpers/database.dart';
import '../helpers/google_maps.dart';
import 'location.dart';
import 'place.dart';

class Places with ChangeNotifier {
  final _values = <Place>[];
  List<Place> get values => [..._values];

  Future<void> pull() async {
    final data = await Database.get(Database.placesTable);
    _values.clear();
    data.forEach((recordMap) => _values.add(Place.fromStorableMap(recordMap)));
    notifyListeners();
  }

  Future<void> add({
    required String title,
    required Location loc,
    required File image,
  }) async {
    final appDocsDir = await getApplicationDocumentsDirectory();
    print(appDocsDir);
    final imgFileName = path.basename(image.path);
    final permImage = await image.copy('${appDocsDir.path}/$imgFileName');
    final address = await GoogleMaps.getFinestAddressInCoords(loc.lat, loc.lng);

    final newPlace = Place(
      id: '${loc.lat}N${loc.lng}W',
      title: title,
      location: loc.copyWith(address),
      image: permImage,
    );

    _values.add(newPlace);
    notifyListeners();

    Database.insert(Database.placesTable, newPlace.toStorableMap());
  }
}
