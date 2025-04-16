import 'package:coffeeshop/src/features/menu/models/models/product_model.dart';
import 'package:dio/dio.dart';

abstract interface class IOrderDataSource {
  Future<Map<String, dynamic>> postOrder({
    required Map<ProductModel, int> items,
  });
}

final class NetworkOrdersDataSource implements IOrderDataSource {
  final Dio _dio;

  const NetworkOrdersDataSource({required Dio dio}) : _dio = dio;

  @override
  Future<Map<String, dynamic>> postOrder({
    required Map<ProductModel, int> items,
  }) async {
    final positions = items.map(
      (key, value) => MapEntry(key.id.toString(), value),
    );
    final response = await _dio.post('/orders', data: {"positions": positions});
    return response.data;
  }
}
