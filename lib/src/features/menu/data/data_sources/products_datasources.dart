import 'dart:io';
import 'package:coffeeshop/src/features/menu/models/DTO/product_dto.dart';
import 'package:dio/dio.dart';

abstract interface class IProductsDataSource {
  Future<List<ProductDTO>> fetchProducts({
    required int categoryId,
    int page = 0,
    int limit = 25,
  });
  Future<ProductDTO> fetchProduct({required int productId});
}

final class NetworkProductsDataSource implements IProductsDataSource {
  final Dio _dio;

  const NetworkProductsDataSource({required Dio dio}) : _dio = dio;

  @override
  Future<List<ProductDTO>> fetchProducts({
    required int categoryId,
    int page = 0,
    int limit = 25,
  }) async {
    try {
      final response = await _dio.get(
        '/products',
        queryParameters: {
          'page': '$page',
          'limit': '$limit',
          'category': '$categoryId',
        },
      );
      final data = response.data['data'];
      if (data is! List) throw const FormatException();
      return (data).map<ProductDTO>((i) => ProductDTO.fromJson(i)).toList();
    } on DioException catch (_) {
      throw SocketException('/products with categoryId = $categoryId');
    }
  }

  @override
  Future<ProductDTO> fetchProduct({required int productId}) async {
    try {
      final response = await _dio.get('products/$productId');
      switch (response.statusCode) {
        case 200:
          final data = response.data['data'];
          return ProductDTO.fromJson(data);
        default:
          throw HttpException('/products/$productId');
      }
    } on DioException catch (_) {
      throw SocketException('/products/$productId');
    }
  }
}
