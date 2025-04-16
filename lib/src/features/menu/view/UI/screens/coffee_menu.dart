import 'package:coffeeshop/src/features/menu/bloc/menu/menu_bloc.dart';
import 'package:coffeeshop/src/features/menu/view/UI/widgets/CustomTextWidget.dart';
import 'package:coffeeshop/src/features/menu/view/UI/widgets/ListCreator.dart';
import 'package:coffeeshop/src/features/menu/view/UI/widgets/basket.dart';
import 'package:coffeeshop/src/features/menu/models/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:coffeeshop/src/features/menu/view/UI/widgets/builders.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<ProductModel> products = [];
dynamic categories = [];

class CoffeeMenu extends StatelessWidget {
  const CoffeeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MenuBloc, MenuState>(
      listener: (context, state) {
        products = state.items;
        categories = state.categories;
      },
      builder:
          (context, state) => Scaffold(
            backgroundColor: Color.fromARGB(255, 235, 246, 255),
            body: Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      elevation: 0,
                      forceElevated: false,
                      backgroundColor: Color.fromARGB(255, 235, 246, 255),
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.none,
                        stretchModes: const [],
                        background: Container(
                          color: Color.fromARGB(255, 235, 246, 255),
                          child: Center(child: ListCreator(categories)),
                        ),
                      ),
                    ),
                    for (int i = 0; i < categories.length; i++) ...{
                      SliverToBoxAdapter(
                        child: Container(
                          key: ValueKey(categories[i].id),
                          child: CustomTextWidget(text: categories[i].slug),
                        ),
                      ),
                      builderGridSliverUniversal(
                        categories[i].id,
                        (groupBy(products, (product) => product.categoryId).map(
                              (key, value) => MapEntry(key, value.length),
                            ))[categories[i].id] ??
                            0,
                        products,
                      ),
                    },
                  ],
                ),
                Positioned(bottom: 20, right: 20, child: Basket()),
              ],
            ),
          ),
    );
  }
}
