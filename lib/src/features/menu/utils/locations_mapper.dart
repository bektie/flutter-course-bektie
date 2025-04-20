import 'package:coffeeshop/src/features/menu/models/DTO/locations_dto.dart';
import 'package:coffeeshop/src/features/menu/models/models/locations_model.dart';

extension LocationsMapper on LocationsDto {
  LocationsModel toModel() {
    return LocationsModel(address: address, lat: lat, lng: lng);
  }

  Map<String, dynamic> toJson() {
    return {'address': address, 'lat': lat, 'lng': lng};
  }

  static LocationsDto fromJson(Map<String, dynamic> json) {
    return LocationsDto(
      address: json['address'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );
  }
}
