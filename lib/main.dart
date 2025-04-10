import 'package:coffeeshop/bloc/blocs/category_bloc.dart';
import 'package:coffeeshop/repositories/category_repository.dart';
import 'package:coffeeshop/repositories/product_repository.dart' show ProductRepository;
import 'package:flutter/material.dart';
import 'UI/screens/main_menu.dart';
import 'bloc/blocs/mainBloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/blocs/basket_bloc.dart';

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
          BlocProvider(create: (_) => BasketBloc()),
          BlocProvider(
            create: (context) => CategoryBloc(
              RepositoryProvider.of<CategoryRepository>(context),
            ),
      )
      ],
        child: MaterialApp(home: MainMenu()),
      ),)
      
  );
}