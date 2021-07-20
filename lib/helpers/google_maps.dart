import 'package:flutter_dotenv/flutter_dotenv.dart';

class GoogleMaps {
  static final _apiKey = dotenv.env['GOOGLE_MAPS_API_KEY'];
}
