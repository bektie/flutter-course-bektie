import 'package:bloc/bloc.dart';
import 'package:coffeeshop/src/features/menu/bloc/states/mainScreen_state.dart';
import 'package:coffeeshop/src/features/menu/data/repositories/product_repository.dart';
import 'package:coffeeshop/src/features/menu/data/repositories/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenEvent {}

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(MainScreenInit()) {
    on<MainScreenEvent>((event, emit) async {
      emit(MainScreenInit());
      try {
        CategoryRepository categoryRepository = CategoryRepository();
        ProductRepository productRepository = ProductRepository();
        await categoryRepository.fetchCategories();
        await productRepository.fetchProducts();
        emit(CoffeeMenu());
      } catch (e) {
        emit(ErrorLoadScreen());
      }
    });
  }
}

class CoffeeMenu extends MainScreenState {}
