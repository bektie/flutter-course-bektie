import 'package:bloc/bloc.dart';
import 'package:coffeeshop/bloc/states/category_state.dart';
import 'package:coffeeshop/repositories/category_repository.dart';


abstract class CategoryEvent {}

class LoadCategoriesEvent extends CategoryEvent {
  LoadCategoriesEvent();
}

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  
  final CategoryRepository repository;

    CategoryBloc(this.repository) : super(CategoryInit()) {
    on<LoadCategoriesEvent>((event, emit) async {
      emit(CategoryLoading());
      try {
        final categories = await repository.fetchCategories();
        emit(CategoryLoaded(categories));
      } catch (e) {
        emit(CategoryError(e.toString()));
      }
    });
  }
}

