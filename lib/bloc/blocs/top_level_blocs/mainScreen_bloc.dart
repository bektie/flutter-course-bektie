import 'package:bloc/bloc.dart';
import 'package:coffeeshop/bloc/states/mainScreen_state.dart';
import 'package:coffeeshop/repositories/product_repository.dart';
import 'package:coffeeshop/repositories/category_repository.dart';


abstract class MainScreenEvent {}

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