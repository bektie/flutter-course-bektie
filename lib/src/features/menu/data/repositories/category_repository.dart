import 'dart:io';

import 'package:coffeeshop/src/features/menu/data/data_sources/categories_datasource.dart';
import 'package:coffeeshop/src/features/menu/models/DTO/category_dto.dart';
import 'package:coffeeshop/src/features/menu/models/models/category_model.dart';
import '../../utils/category_mapper.dart';

abstract interface class ICategoriesRepository {
  Future<List<CategoryModel>> loadCategories();
}

final class CategoriesRepository implements ICategoriesRepository {
  final ICategoriesDataSource _networkCategoriesDataSource;

  CategoriesRepository({
    required ICategoriesDataSource networkCategoriesDataSource,
  }) : _networkCategoriesDataSource = networkCategoriesDataSource;

  @override
  Future<List<CategoryModel>> loadCategories() async {
    List<CategoryDto> dtos = <CategoryDto>[];
    try {
      dtos = await _networkCategoriesDataSource.fetchCategories();
    } on SocketException {
      //takedb
    }
    final categories = dtos.map((e) => e.toModel()).toList();
    categories.removeLast();
    return categories;
  }
}
