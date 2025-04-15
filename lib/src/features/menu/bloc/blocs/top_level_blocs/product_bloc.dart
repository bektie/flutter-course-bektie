import 'package:bloc/bloc.dart';
import 'package:coffeeshop/src/features/menu/bloc/states/product_state.dart';
import 'package:coffeeshop/src/features/menu/data/repositories/product_repository.dart';

abstract class ProductEvent {}

class LoadProductsEvent extends ProductEvent {
  final int page;
  final int limit;

  LoadProductsEvent(this.page, this.limit);
}

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;
  ProductBloc(this.repository) : super(ProductInit()) {
    on<LoadProductsEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await repository.fetchProducts(
          page: event.page,
          limit: event.limit,
        );
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
