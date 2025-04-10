import 'package:coffeeshop/bloc/blocs/category_bloc.dart';
import 'package:flutter/material.dart';
import 'UI/screens/coffee_menu.dart';
import 'bloc/blocs/mainBloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/blocs/basket_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const MainblocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BasketBloc()),
        BlocProvider(create: (_) => CategoryBloc()),
      ],
      child: MaterialApp(home: CoffeeMenu()),
    ),
  );
}