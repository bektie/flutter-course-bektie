import 'package:coffeeshop/src/features/menu/view/UI/screens/coffee_menu.dart'
    as ui;
import 'package:coffeeshop/src/features/menu/bloc/blocs/top_level_blocs/category_bloc.dart';
import 'package:coffeeshop/src/features/menu/bloc/blocs/top_level_blocs/mainScreen_bloc.dart';
import 'package:coffeeshop/src/features/menu/bloc/blocs/top_level_blocs/product_bloc.dart';
import 'package:coffeeshop/src/features/menu/bloc/states/mainScreen_state.dart';
import 'package:coffeeshop/src/features/menu/data/repositories/category_repository.dart';
import 'package:coffeeshop/src/features/menu/data/repositories/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffeeshop/src/features/menu/view/UI/screens/error_loading_screen.dart'
    as ui;

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainScreenBloc, MainScreenState>(
        builder: (context, state) {
          if (state is MainScreenInit) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ErrorLoadScreen) {
            return ui.ErrorLoadScreen();
          }
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create:
                    (_) =>
                        ProductBloc(ProductRepository())
                          ..add(LoadProductsEvent(1, 25)),
              ),
              BlocProvider(
                create:
                    (_) =>
                        CategoryBloc(CategoryRepository())
                          ..add(LoadCategoriesEvent()),
              ),
            ],
            child: const ui.CoffeeMenu(),
          );
        },
      ),
    );
  }
}
