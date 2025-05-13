import 'package:coffeeshop/src/app.dart';
import 'package:coffeeshop/src/features/menu/bloc/mainBloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const MainblocObserver();
  runApp(CoffeeShopApp());
}
