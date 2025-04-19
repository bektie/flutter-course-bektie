import 'package:coffeeshop/src/common/database.dart';
import 'package:coffeeshop/src/features/menu/data/data_sources/categories_datasource.dart';
import 'package:coffeeshop/src/features/menu/data/data_sources/products_datasources.dart';
import 'package:coffeeshop/src/features/menu/models/DTO/product_dto.dart';
import 'package:coffeeshop/src/features/menu/models/DTO/category_dto.dart';
import 'package:sqflite/sqflite.dart';

abstract interface class IDBCategories implements ICategoriesDataSource {
  Future<void> saveCategories(List<CategoryDto> categories);
}

abstract interface class IDBProducts implements IProductsDataSource {
  Future<void> saveProducts(List<ProductDTO> products);
}

final class DbProductsDataSource implements IDBProducts {
  const DbProductsDataSource({required DataBase db});

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
      whereArgs: [categoryId.toString()],
      limit: limit,
      offset: offset,
    );

    return result.map((e) => ProductDTO.fromJson(e)).toList();
  }

  Future<void> saveProducts(List<ProductDTO> products) async {
    final db = await DataBase.database;
    final batch = db.batch();

    for (var product in products) {
      batch.insert(
        'products',
        product.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
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

    for (var category in categories) {
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
