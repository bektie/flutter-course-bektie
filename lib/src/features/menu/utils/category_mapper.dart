import 'package:coffeeshop/src/features/menu/models/DTO/category_dto.dart';
import 'package:coffeeshop/src/features/menu/models/models/category_model.dart';

extension CategoryMapper on CategoryDto {
  CategoryModel toModel() {
    return CategoryModel(id: id, slug: slug);
  }
}
