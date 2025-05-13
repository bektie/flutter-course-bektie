class LocationsModel {
  final String address;
  final double lat;
  final double lng;

  LocationsModel({required this.address, required this.lat, required this.lng});

  Map<String, dynamic> toJson() {
    return {'address': address, 'lat': lat, 'lng': lng};
  }

  Map<String, dynamic> toMap() {
    return {'address': address, 'lat': lat, 'lng': lng};
  }

  factory LocationsModel.fromJson(Map<String, dynamic> json) {
    return LocationsModel(
      address: json['address'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );
  }
}
