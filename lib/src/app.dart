import 'package:coffeeshop/src/features/menu/bloc/cart/cart_bloc.dart';
import 'package:coffeeshop/src/features/menu/bloc/menu/menu_bloc.dart';
import 'package:coffeeshop/src/features/menu/data/data_sources/categories_datasource.dart';
import 'package:coffeeshop/src/features/menu/data/data_sources/order_data_source.dart';
import 'package:coffeeshop/src/features/menu/data/data_sources/products_datasources.dart';
import 'package:coffeeshop/src/features/menu/data/repositories/category_repository.dart';
import 'package:coffeeshop/src/features/menu/data/repositories/order_repository.dart';
import 'package:coffeeshop/src/features/menu/data/repositories/product_repository.dart';
import 'package:coffeeshop/src/features/menu/view/UI/screens/coffee_menu.dart';
import 'package:coffeeshop/src/theme/theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeShopApp extends StatelessWidget {
  const CoffeeShopApp({super.key});
  static final dioClient = Dio(
    BaseOptions(baseUrl: 'https://coffeeshop.academy.effective.band/api/v1'),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<ICategoriesRepository>(
            create:
                (context) => CategoriesRepository(
                  networkCategoriesDataSource: NetworkCategoriesDataSource(
                    dio: dioClient,
                  ),
                ),
          ),
          RepositoryProvider<IProductsRepository>(
            create:
                (context) => ProductsRepository(
                  networkProductsDataSource: NetworkProductsDataSource(
                    dio: dioClient,
                  ),
                ),
          ),
          RepositoryProvider<IOrderRepository>(
            create:
                (context) => OrderRepository(
                  networkOrderDataSource: NetworkOrdersDataSource(
                    dio: dioClient,
                  ),
                ),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CartBloc(context.read<IOrderRepository>()),
            ),
            BlocProvider(
              create:
                  (context) => MenuBloc(
                    context.read<IProductsRepository>(),
                    context.read<ICategoriesRepository>(),
                  )..add(const CategoryLoadingStarted()),
            ),
          ],
          child: MaterialApp(home: MenuScreen()),
        ),
      ),
    );
  }
}
