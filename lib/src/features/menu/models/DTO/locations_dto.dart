class LocationsDto {
  final String address;
  final double lat;
  final double lng;

  LocationsDto({required this.address, required this.lat, required this.lng});

  static fromJson(location) {}
}
