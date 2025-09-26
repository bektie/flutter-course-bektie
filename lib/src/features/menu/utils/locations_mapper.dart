import 'package:coffeeshop/src/features/menu/models/DTO/locations_dto.dart';
import 'package:coffeeshop/src/features/menu/models/models/locations_model.dart';

extension LocationsDtoMapper on LocationsDto {
  toModel() {
    return LocationsModel(address: address, lat: lat, lng: lng);
  }
}
