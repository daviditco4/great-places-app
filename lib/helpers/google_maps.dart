import 'package:flutter_dotenv/flutter_dotenv.dart';

class GoogleMaps {
  static const defaultZoom = 15.0;
  static final _apiKey = dotenv.env['GOOGLE_MAPS_API_KEY'];

  static String getStaticImageUrlInCoordinates(double lat, double long) {
    return 'https://maps.googleapis.com/maps/api/staticmap?'
        'zoom=${defaultZoom.toInt()}&'
        'size=509x262&scale=2&'
        'markers=color:red%7C$lat,$long&'
        'key=$_apiKey';
  }
}
