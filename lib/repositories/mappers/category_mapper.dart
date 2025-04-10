import 'package:coffeeshop/data/category_dto.dart';
import 'package:coffeeshop/data/category_model.dart';

extension CategoryMapper on CategoryDto {
  CategoryModel toModel() {
    return CategoryModel(
      id: id,
      slug: slug
    );
  }
}