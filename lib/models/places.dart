import 'package:flutter/foundation.dart';

import 'place.dart';

class Places with ChangeNotifier {
  final _values = <Place>[];
  List<Place> get values => [..._values];
}
