import 'package:coffeeshop/data/product_model.dart';


abstract class ProductState {}

class ProductInit extends ProductState {}
class ProductLoading extends ProductState {
  ProductLoading();
}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;
  ProductLoaded(this.products);
}

class ProductError extends ProductState {
  final String error;
  ProductError(this.error);
}

class ProductLoadingMore extends ProductState {}

class ProductLoadedMore extends ProductState {
  final List<ProductModel> products;
  ProductLoadedMore(this.products);
}

class ProductLoadingMoreError extends ProductState {
  final String error;
  ProductLoadingMoreError(this.error);
}