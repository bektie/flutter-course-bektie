import 'dart:io';

import 'package:dio/dio.dart';

final dio = Dio();
final String locationsUrl =
    'http://coffeeshop.academy.effective.band/api/v1/locations';

class LocationsDataSource {
  Future<List<dynamic>> getLocations() async {
    try {
      final response = await dio.get(locationsUrl);
      return response.data;
    } on SocketException {
      return [];
    }
  }
}
