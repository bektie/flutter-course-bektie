import 'package:coffeeshop/src/common/database.dart';
import 'package:coffeeshop/src/features/menu/data/data_sources/categories_datasource.dart';
import 'package:coffeeshop/src/features/menu/data/data_sources/products_datasources.dart';
import 'package:coffeeshop/src/features/menu/models/DTO/product_dto.dart';
import 'package:coffeeshop/src/features/menu/models/DTO/category_dto.dart';

abstract interface class IDBCategories implements ICategoriesDataSource {}

abstract interface class IDBProducts implements IProductsDataSource {}

final class DbProductsDataSource {
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
}

final class DbCategoriesDataSource {
  const DbCategoriesDataSource({required DataBase db});

  Future<List<CategoryDto>> fetchCategories() async {
    final db = await DataBase.database;

    final result = await db.query('categories');

    return result.map((e) => CategoryDto.fromJson(e)).toList();
  }
}
