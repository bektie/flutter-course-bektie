import 'package:coffeeshop/data/category_model.dart';


abstract class CategoryState {}

class CategoryInit extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<CategoryModel> categories;

  CategoryLoaded(this.categories);
}

class CategoryError extends CategoryState {
  final String error;
  CategoryError(this.error);

}
