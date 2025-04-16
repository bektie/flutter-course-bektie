import 'dart:io';

import 'package:coffeeshop/src/features/menu/data/data_sources/dbsource.dart';
import 'package:coffeeshop/src/features/menu/data/data_sources/products_datasources.dart';
import 'package:coffeeshop/src/features/menu/models/DTO/product_dto.dart';
import 'package:coffeeshop/src/features/menu/models/models/category_model.dart';
import 'package:coffeeshop/src/features/menu/models/models/product_model.dart';
import 'package:coffeeshop/src/features/menu/utils/product_mapper.dart';

abstract interface class IProductsRepository {
  Future<List<ProductModel>> loadProducts({
    required CategoryModel category,
    int page = 0,
    int limit = 25,
  });
}

final class ProductsRepository implements IProductsRepository {
  final IProductsDataSource _networkProductsDataSource;
  final IDBProducts _DbProducts;

  ProductsRepository({
    required IProductsDataSource networkProductsDataSource,
    required IDBProducts DbProducts,
  }) : _networkProductsDataSource = networkProductsDataSource,
       _DbProducts = DbProducts;

  @override
  Future<List<ProductModel>> loadProducts({
    required CategoryModel category,
    int page = 0,
    int limit = 25,
  }) async {
    List<ProductDTO> dtos = <ProductDTO>[];
    try {
      dtos = await _networkProductsDataSource.fetchProducts(
        categoryId: category.id,
        page: page,
        limit: limit,
      );
    } on SocketException {
      dtos = await _DbProducts.fetchProducts(
        categoryId: category.id,
        page: page,
        limit: limit,
      );
    }

    return dtos.map((e) => e.toModel()).toList();
  }
}
