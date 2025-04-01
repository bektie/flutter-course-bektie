import 'package:coffeeshop/globals.dart';
import 'package:flutter/material.dart';
import 'screens/coffee_menu.dart';
import 'data/api.dart';
import 'screens/error_loading_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/basket_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getData();
  if (!buildCustoms) {
    runApp(MaterialApp(home: ErrorLoadScreen()));
    return;
  } else {
  runApp(
    BlocProvider(
      create: (_) => BasketBloc(),
      child: MaterialApp(home: CoffeeMenu()),
    ),
  );
}
}