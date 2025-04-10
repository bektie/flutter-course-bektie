import 'package:coffeeshop/data/DTO/category_dto.dart';
import 'package:coffeeshop/data/models/category_model.dart';

extension CategoryMapper on CategoryDto {
  CategoryModel toModel() {
    return CategoryModel(
      id: id,
      slug: slug
    );
  }
}