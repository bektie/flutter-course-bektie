import 'dart:io';

import 'package:coffeeshop/src/features/menu/data/data_sources/categories_datasource.dart';
import 'package:coffeeshop/src/features/menu/data/data_sources/dbsource.dart';
import 'package:coffeeshop/src/features/menu/models/DTO/category_dto.dart';
import 'package:coffeeshop/src/features/menu/models/models/category_model.dart';
import '../../utils/category_mapper.dart';

abstract interface class ICategoriesRepository {
  Future<List<CategoryModel>> loadCategories();
}

final class CategoriesRepository implements ICategoriesRepository {
  final ICategoriesDataSource _networkCategoriesDataSource;
  final IDBCategories _localCategories;

  CategoriesRepository({
    required IDBCategories localCategories,
    required ICategoriesDataSource networkCategoriesDataSource,
  }) : _networkCategoriesDataSource = networkCategoriesDataSource,
       _localCategories = localCategories;

  @override
  Future<List<CategoryModel>> loadCategories() async {
    List<CategoryDto> dtos = <CategoryDto>[];
    try {
      dtos = await _networkCategoriesDataSource.fetchCategories();
      await _localCategories.saveCategories(dtos);
    } on SocketException {
      dtos = await _localCategories.fetchCategories();
    }
    final categories = dtos.map((e) => e.toModel()).toList();

    return categories;
  }
}
