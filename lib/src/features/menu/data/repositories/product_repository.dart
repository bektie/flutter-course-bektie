import 'package:coffeeshop/src/features/menu/data/DTO/product_dto.dart';
import 'package:coffeeshop/src/features/menu/data/models/product_model.dart';
import 'package:coffeeshop/src/globals.dart';
import 'package:dio/dio.dart';
import 'package:coffeeshop/src/features/menu/utils/product_mapper.dart';

class ProductRepository {
  final Dio dio;

  ProductRepository({Dio? dio}) : dio = dio ?? Dio();

  Future<List<ProductModel>> fetchProducts({
    int page = 1,
    int limit = 25,
  }) async {
    try {
      final response = await dio.get(
        productsUrl,
        queryParameters: {'page': page, 'limit': limit},
      );

      final List data = response.data['data'];
      if (data.isEmpty) {
        throw Exception('Сервер вернул пустой список продуктов');
      }
      return data.map((json) => ProductDTO.fromJson(json).toModel()).toList();
    } catch (e) {
      print('Ошибка загрузки продуктов: $e');
      rethrow;
    }
  }
}
