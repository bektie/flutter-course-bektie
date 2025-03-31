import 'package:coffeeshop/globals.dart';
import 'package:flutter/material.dart';
import 'screens/coffee_menu.dart';
import 'data/api.dart';
import 'screens/error_loading_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getData();
  if (!buildCustoms) {
    runApp(MaterialApp(home: ErrorLoadScreen()));
    return;
  }
  runApp(MaterialApp(home: CoffeeMenu()));
}