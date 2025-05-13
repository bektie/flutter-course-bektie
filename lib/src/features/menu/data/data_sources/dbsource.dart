import 'package:coffeeshop/src/common/database.dart';
import 'package:coffeeshop/src/features/menu/data/data_sources/categories_datasource.dart';
import 'package:coffeeshop/src/features/menu/data/data_sources/locations_datasource.dart';
import 'package:coffeeshop/src/features/menu/data/data_sources/products_datasources.dart';
import 'package:coffeeshop/src/features/menu/models/DTO/locations_dto.dart';
import 'package:coffeeshop/src/features/menu/models/DTO/product_dto.dart';
import 'package:coffeeshop/src/features/menu/models/DTO/category_dto.dart';
import 'package:coffeeshop/src/features/menu/utils/category_mapper.dart';
import 'package:coffeeshop/src/features/menu/utils/product_mapper.dart';
import 'package:coffeeshop/src/features/menu/utils/locations_mapper.dart';
import 'package:dio/dio.dart';
import 'package:sqflite/sqflite.dart';

final dio = Dio(
  (BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 15),
  )),
);

abstract interface class IDBCategories implements ICategoriesDataSource {
  Future<void> saveCategories(List<CategoryDto> categories);
}

abstract interface class IDBProducts implements IProductsDataSource {
  Future<void> saveProducts(List<ProductDTO> products);
}

abstract interface class IDBLocations implements ILocationsDataSource {
  Future<void> saveLocations(List<LocationsDto> locations);
  Future<List<dynamic>> getLocations();
}

final class DbProductsDataSource implements IDBProducts {
  const DbProductsDataSource({required DataBase db});

  @override
  Future<void> saveProducts(List<ProductDTO> _ignored) async {
    final db = await DataBase.database;
    final result = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM products'),
    );

    if (result == 0) {
      const limit = 100;
      int page = 0;
      bool hasMore = true;

      while (hasMore) {
        final response = await dio.get(
          'https://coffeeshop.academy.effective.band/api/v1/products',
          queryParameters: {'page': page, 'limit': limit},
        );

        final data = response.data['data'] as List;

        if (data.isEmpty) {
          hasMore = false;
        } else {
          for (var product in data) {
            final productDto = ProductDTO.fromJson(product);
            await db.insert(
              'products',
              productDto.toModel().toMap(),
              conflictAlgorithm: ConflictAlgorithm.replace,
            );
          }
          page++;
        }
      }
    }
  }

  @override
  Future<List<ProductDTO>> fetchProducts({
    required int categoryId,
    int page = 0,
    int limit = 25,
  }) async {
    final offset = page * limit;
    final db = await DataBase.database;

    final result = await db.query(
      'products',
      where: 'categoryId = ?',
      whereArgs: [categoryId],
      limit: limit,
      offset: offset,
    );

    return result.map((e) => ProductDTO.fromDbJson(e)).toList();
  }

  @override
  Future<ProductDTO> fetchProduct({required int productId}) async {
    print('aaa');
    final a = await ProductDTO(
      id: 1,
      name: '1',
      image: '1',
      price: 1,
      categoryId: 1,
    );
    return a;
  }
}

final class DbCategoriesDataSource implements IDBCategories {
  const DbCategoriesDataSource({required DataBase db});

  @override
  Future<void> saveCategories(List<CategoryDto> categories) async {
    final db = await DataBase.database;
    final result = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM categories'),
    );
    if (result == 0) {
      final response = await dio.get(
        'https://coffeeshop.academy.effective.band/api/v1/products/categories',
      );
      final data = response.data['data'];
      for (var category in data) {
        final categoryDto = CategoryDto.fromJson(category);
        await db.insert(
          'categories',
          categoryDto.toModel().toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    }
  }

  @override
  Future<List<CategoryDto>> fetchCategories() async {
    final db = await DataBase.database;

    final result = await db.query('categories');

    return result.map((e) => CategoryDto.fromDbJson(e)).toList();
  }
}

final class DbLocationsDataSource implements IDBLocations {
  const DbLocationsDataSource({required DataBase db});

  @override
  Future<List<dynamic>> getLocations() async {
    final db = await DataBase.database;

    final result = await db.query('locations');

    return result.map((e) => LocationsDto.fromJson(e)).toList();
  }

  @override
  Future<void> saveLocations(List<LocationsDto> locations) async {
    final db = await DataBase.database;
    final result = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM locations'),
    );
    if (result == 0) {
      final response = await dio.get(
        'https://coffeeshop.academy.effective.band/api/v1/locations',
      );
      final data = response.data['data'];
      for (var location in data) {
        final locationDto = LocationsDto.fromJson(location);
        await db.insert(
          'locations',
          locationDto!.toModel().toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    }
  }
}
