import 'package:coffeeshop/src/features/menu/models/DTO/locations_dto.dart';
import 'package:dio/dio.dart';

final dio = Dio();
final String locationsUrl =
    'http://coffeeshop.academy.effective.band/api/v1/locations';

abstract interface class ILocationsDataSource {
  getLocations() {}
}

class NetworkLocationsDataSource implements ILocationsDataSource {
  @override
  Future<List<dynamic>> getLocations() async {
    try {
      final response = await dio.get(locationsUrl);
      final data = response.data['data'];
      if (data is! List) throw const FormatException();
      final locations =
          data
              .map((i) => LocationsDto.fromJson(i))
              .whereType<LocationsDto>()
              .toList();
      return locations;
    } catch (e) {
      rethrow;
    }
  }
}
