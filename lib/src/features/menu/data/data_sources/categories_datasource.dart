import 'dart:io';
import 'package:coffeeshop/src/common/database.dart';
import 'package:coffeeshop/src/features/menu/models/DTO/category_dto.dart';
import 'package:dio/dio.dart';

abstract interface class ICategoriesDataSource {
  Future<List<CategoryDto>> fetchCategories();
}

final class NetworkCategoriesDataSource implements ICategoriesDataSource {
  final Dio _dio;

  const NetworkCategoriesDataSource({required Dio dio}) : _dio = dio;

  @override
  Future<List<CategoryDto>> fetchCategories() async {
    try {
      final response = await _dio.get('/products/categories');
      final data = response.data['data'];
      if (data is! List) throw const FormatException();
      final categories =
          (data).map<CategoryDto>((i) => CategoryDto.fromJson(i)).toList();
      for (final category in categories) {
        await DataBase.insertCategory(
          id: category.id.toString(),
          slug: category.slug,
        );
      }
      return categories;
    } on DioException catch (_) {
      throw const SocketException('/products/categories');
    }
  }
}
