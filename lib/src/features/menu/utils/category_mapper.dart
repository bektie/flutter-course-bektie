import 'package:coffeeshop/src/features/menu/data/DTO/category_dto.dart';
import 'package:coffeeshop/src/features/menu/data/models/category_model.dart';

extension CategoryMapper on CategoryDto {
  CategoryModel toModel() {
    return CategoryModel(id: id, slug: slug);
  }
}
