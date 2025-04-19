import 'package:coffeeshop/src/common/database.dart';
import 'package:coffeeshop/src/features/menu/data/data_sources/categories_datasource.dart';
import 'package:coffeeshop/src/features/menu/data/data_sources/products_datasources.dart';
import 'package:coffeeshop/src/features/menu/models/DTO/product_dto.dart';
import 'package:coffeeshop/src/features/menu/models/DTO/category_dto.dart';
import 'package:dio/dio.dart';
import 'package:sqflite/sqflite.dart';

final dio = Dio();

abstract interface class IDBCategories implements ICategoriesDataSource {
  Future<void> saveCategories(List<CategoryDto> categories);
}

abstract interface class IDBProducts implements IProductsDataSource {
  Future<void> saveProducts(List<ProductDTO> products);
}

final class DbProductsDataSource implements IDBProducts {
  const DbProductsDataSource({required DataBase db});

  Future<void> saveProducts(List<ProductDTO> products) async {
    final db = await DataBase.database;
    final batch = db.batch();
    final axios = dio.get(
      'https://coffeeshop.academy.effective.band/api/v1/products',
    );
    final response = await axios;
    final data = response.data;
    final List<ProductDTO> meow =
        (data as List).map((e) => ProductDTO.fromJson(e)).toList();
    for (var product in meow) {
      batch.insert(
        'products',
        product.toDbJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
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

  Future<void> saveCategories(List<CategoryDto> categories) async {
    final db = await DataBase.database;
    final batch = db.batch();
    final axios = dio.get(
      'https://coffeeshop.academy.effective.band/api/v1/categories',
    );
    final response = await axios;
    final data = response.data;
    final List<ProductDTO> cats =
        (data as List).map((e) => ProductDTO.fromJson(e)).toList();
    for (var category in cats) {
      batch.insert(
        'categories',
        category.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  }

  @override
  Future<List<CategoryDto>> fetchCategories() async {
    final db = await DataBase.database;

    final result = await db.query('categories');

    return result.map((e) => CategoryDto.fromJson(e)).toList();
  }
}
