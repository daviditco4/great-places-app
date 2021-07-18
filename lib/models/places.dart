import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'location.dart';
import 'place.dart';

class Places with ChangeNotifier {
  final _values = <Place>[];
  List<Place> get values => [..._values];

  Future<void> add({required String title, required File image}) async {
    final appDocsDir = await getApplicationDocumentsDirectory();
    final imgFileName = path.basename(image.path);
    final permImage = await image.copy('${appDocsDir.path}/$imgFileName');

    final newPlace = Place(
      id: DateTime.now().toIso8601String(),
      title: title,
      location: const Location(lat: 0.0, long: 0.0),
      image: permImage,
    );

    _values.add(newPlace);
    notifyListeners();
  }
}
