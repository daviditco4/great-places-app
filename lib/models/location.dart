import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class Location {
  const Location({required this.lat, required this.lng, this.addr});
  Location.fromLatLng(LatLng ll) : this(lat: ll.latitude, lng: ll.longitude);
  final double lat, lng;
  final String? addr;
  Location copyWith(String? addr) => Location(lat: lat, lng: lng, addr: addr);
  LatLng toLatLng() => LatLng(lat, lng);
  String _coToString(double co) => co.toStringAsFixed(5).replaceFirst('.', ',');
  @override
  String toString() => addr ?? '${_coToString(lat)}°N ${_coToString(lng)}°W';
}
