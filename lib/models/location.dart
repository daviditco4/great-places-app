class Location {
  const Location({required this.lat, required this.long, this.addr});
  final double lat;
  final double long;
  final String? addr;
  String _coToString(double co) => co.toStringAsFixed(5).replaceFirst('.', ',');
  @override
  String toString() => addr ?? '${_coToString(lat)}°N ${_coToString(long)}°W';
}
