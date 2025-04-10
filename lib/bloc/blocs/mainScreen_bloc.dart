import 'package:bloc/bloc.dart';
import 'package:coffeeshop/bloc/states/mainScreen_state.dart';
import 'package:coffeeshop/data/items.dart';


abstract class MainScreenEvent {}

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(MainScreenInit()) {
    on<MainScreenEvent>((event, emit) async {
      emit(MainScreenInit());
      try {
        await categoryRepository.fetchCategories();
        await productRepository.fetchProducts();
        emit(CoffeeMenu());
      } catch (e) {
        emit(ErrorLoadScreen());
      }
    });
  }
}