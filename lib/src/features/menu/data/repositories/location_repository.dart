import 'dart:io';
import 'package:coffeeshop/src/features/menu/data/data_sources/dbsource.dart';
import 'package:coffeeshop/src/features/menu/data/data_sources/locations_datasource.dart';

import 'package:coffeeshop/src/features/menu/models/DTO/locations_dto.dart';
import 'package:coffeeshop/src/features/menu/models/models/locations_model.dart';
import 'package:coffeeshop/src/features/menu/utils/locations_mapper.dart';

abstract interface class ILocationsRepository {
  loadLocations() {}
}

class LocationRepository implements ILocationsRepository {
  final ILocationsDataSource _networkLocationsDataSource;
  final IDBLocations _localLocations;
  LocationRepository({
    required IDBLocations localLocations,
    required ILocationsDataSource networkLocationsDataSource,
  }) : _networkLocationsDataSource = networkLocationsDataSource,
       _localLocations = localLocations;

  @override
  Future<List<LocationsModel>> loadLocations() async {
    List<LocationsDto> dtos = <LocationsDto>[];
    try {
      dtos = await _networkLocationsDataSource.getLocations();
      await _localLocations.saveLocations(dtos);
    } on SocketException {
      dtos = (await _localLocations.getLocations()).cast<LocationsDto>();
    }
    final locations =
        dtos.map((e) => e.toModel()).toList().cast<LocationsModel>();
    return locations;
  }
}
