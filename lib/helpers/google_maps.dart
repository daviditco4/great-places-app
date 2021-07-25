import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class GoogleMaps {
  static const defaultZoom = 15.0;
  static final _apiUrl = 'https://maps.googleapis.com/maps/api';
  static final _apiKeyForDroid = dotenv.env['GOOGLE_MAPS_API_KEY_FOR_ANDROID'];
  static final _apiKeyForIP = dotenv.env['GOOGLE_MAPS_API_KEY_FOR_IP'];

  static String getStaticImageUrlInCoordinates(double lat, double lng) {
    return '$_apiUrl/staticmap?'
        'zoom=${defaultZoom.toInt()}&'
        'size=509x262&scale=2&'
        'markers=color:red%7C$lat,$lng&'
        'key=$_apiKeyForDroid';
  }

  static Future<String?> getFinestAddressInCoords(double lt, double lng) async {
    try {
      final uri = '$_apiUrl/geocode/json?latlng=$lt,$lng&key=$_apiKeyForIP';
      final response = await http.get(Uri.parse(uri));
      final resBody = json.decode(response.body) as Map<String, dynamic>;

      switch (resBody['status']) {
        case 'OK':
          return resBody['results'][0]['formatted_address'];
        case 'ZERO_RESULTS':
        default:
          if (resBody['error_message'] != null) print(resBody['error_message']);
          return null;
      }
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
