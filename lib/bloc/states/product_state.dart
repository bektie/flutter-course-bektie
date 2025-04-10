import 'package:coffeeshop/data/models/product_model.dart';


abstract class ProductState {}

class ProductInit extends ProductState {}
class ProductLoading extends ProductState {
  ProductLoading();
}

abstract class ProductLoadedBase extends ProductState {
  final List<ProductModel> products;
  ProductLoadedBase(this.products);
}

class ProductLoaded extends ProductLoadedBase {
  ProductLoaded(List<ProductModel> products) : super(products);
}

class ProductLoadedMore extends ProductLoadedBase {
  ProductLoadedMore(List<ProductModel> products) : super(products);
}

class ProductError extends ProductState {
  final String error;
  ProductError(this.error);
}

class ProductLoadingMore extends ProductState {}


class ProductLoadingMoreError extends ProductState {
  final String error;
  ProductLoadingMoreError(this.error);
}