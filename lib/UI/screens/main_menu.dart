import 'package:coffeeshop/UI/screens/coffee_menu.dart' as ui;
import 'package:coffeeshop/bloc/states/mainScreen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffeeshop/UI/screens/error_loading_screen.dart' as ui;

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(builder: (context, state) {
        if (state is MainScreenInit) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ErrorLoadScreen) {
          return ui.ErrorLoadScreen();
        }
        if (state is CoffeeMenu) {
          return ui.CoffeeMenu();
        }
        return Center(child: Text('Unknown state'));
      }),
    );
  }
}
