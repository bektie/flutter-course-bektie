import 'package:coffeeshop/bloc/blocs/low_level_blocs/basket_bloc.dart';
import 'package:coffeeshop/bloc/blocs/low_level_blocs/price_icons_bloc.dart';
import 'package:coffeeshop/bloc/blocs/top_level_blocs/category_bloc.dart';
import 'package:coffeeshop/bloc/blocs/top_level_blocs/mainScreen_bloc.dart';
import 'package:coffeeshop/bloc/blocs/top_level_blocs/product_bloc.dart';
import 'package:coffeeshop/repositories/category_repository.dart';
import 'package:coffeeshop/repositories/product_repository.dart' show ProductRepository;
import 'package:flutter/material.dart';
import 'package:coffeeshop/bloc/blocs/low_level_blocs/coffee_card_cubit.dart';
import 'UI/screens/main_menu.dart';
import 'bloc/blocs/top_level_blocs/mainBloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const MainblocObserver();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => CategoryRepository()),
        RepositoryProvider(create: (_) => ProductRepository()),
      ], child: 
      MultiBlocProvider( 
        providers: [
          BlocProvider(
            create: (context) => ProductBloc(
              RepositoryProvider.of<ProductRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => CategoryBloc(
              RepositoryProvider.of<CategoryRepository>(context),
            ),
        ),
        BlocProvider(
            create: (context) => BasketBloc(),
        ),
        BlocProvider(
            create: (context) => PriceIconsBloc(),
        ),
        BlocProvider(
            create: (context) => PriceBloc(),
        ),
        
      ],
        child: MaterialApp(home: BlocProvider(
          create: (_) => MainScreenBloc()..add(MainScreenEvent()),
          child: MainMenu(),
          ),
        ),
      ),
    )
  );
}