import 'package:coffeeshop/src/app.dart';
import 'package:flutter/material.dart';
import 'src/features/menu/bloc/blocs/top_level_blocs/mainBloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const MainblocObserver();
  runApp(CoffeeShopApp());
}
