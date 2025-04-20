class LocationsDto {
  final String address;
  final double lat;
  final double lng;

  LocationsDto({required this.address, required this.lat, required this.lng});

  static LocationsDto? fromJson(Map<String, dynamic> location) {
    final address = location['address'];
    final lat = location['lat'];
    final lng = location['lng'];

    if (address == null || lat == null || lng == null) return null;

    return LocationsDto(
      address: address,
      lat: lat.toDouble(),
      lng: lng.toDouble(),
    );
  }
}
