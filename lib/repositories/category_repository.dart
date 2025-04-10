import 'package:coffeeshop/data/DTO/category_dto.dart';
import 'package:coffeeshop/data/models/category_model.dart';
import 'package:coffeeshop/globals.dart';
import 'package:dio/dio.dart';
import 'mappers/category_mapper.dart';

class CategoryRepository {
  final Dio dio;

  CategoryRepository({Dio? dio}) : dio = dio ?? Dio();

  Future<List<CategoryModel>> fetchCategories() async {
    final response = await dio.get(categoriesUrl);
    
    final List data = response.data['data'];
    
    final categories = data.map((json) => CategoryDto.fromJson(json).toModel()).toList();
    categories.removeLast();

    return categories;
  }
}

