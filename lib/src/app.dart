import 'package:coffeeshop/src/features/menu/data/data_sources/categories_datasource.dart';
import 'package:coffeeshop/src/features/menu/data/data_sources/products_datasources.dart';
import 'package:coffeeshop/src/features/menu/data/repositories/category_repository.dart';
import 'package:coffeeshop/src/features/menu/data/repositories/product_repository.dart';
import 'package:coffeeshop/src/features/menu/view/UI/screens/main_menu.dart';
import 'package:coffeeshop/src/features/menu/bloc/blocs/low_level_blocs/basket_bloc.dart';
import 'package:coffeeshop/src/features/menu/bloc/blocs/low_level_blocs/list_bloc.dart';
import 'package:coffeeshop/src/features/menu/bloc/blocs/top_level_blocs/category_bloc.dart';
import 'package:coffeeshop/src/features/menu/bloc/blocs/top_level_blocs/mainScreen_bloc.dart';
import 'package:coffeeshop/src/features/menu/bloc/blocs/top_level_blocs/product_bloc.dart';
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
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create:
                  (context) => ProductBloc(
                    RepositoryProvider.of<ProductsRepository>(context),
                  ),
            ),
            BlocProvider(
              create:
                  (context) => CategoryBloc(
                    RepositoryProvider.of<CategoriesRepository>(context),
                  ),
            ),
            BlocProvider(create: (context) => BasketBloc()),
            BlocProvider(create: (context) => ListBloc()),
          ],
          child: MaterialApp(
            home: BlocProvider(
              create: (_) => MainScreenBloc()..add(MainScreenEvent()),
              child: MainMenu(),
            ),
          ),
        ),
      ),
    );
  }
}
