import 'package:flutter/material.dart';
import 'screens/coffee_menu.dart';
import 'data/api.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getData();
  runApp(MaterialApp(home: CoffeeMenu()));
}