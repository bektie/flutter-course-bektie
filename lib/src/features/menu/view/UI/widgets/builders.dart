import 'package:coffeeshop/src/features/menu/view/UI/widgets/coffee_card.dart';
import 'package:coffeeshop/src/features/menu/bloc/blocs/low_level_blocs/coffee_card_cubit.dart';
import 'package:coffeeshop/src/features/menu/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

SliverGrid builderGridSliverUniversal(
  int categoryId,
  int itemCount,
  List<ProductModel> products,
) {
  final filteredProducts =
      products.where((product) => product.categoryId == categoryId).toList();

  return SliverGrid(
    delegate: SliverChildBuilderDelegate((context, index) {
      try {
        final coffee = filteredProducts[index];
        return BlocProvider(
          create: (_) => PriceIconsBloc(),
          child: CoffeeCard(
            name: coffee.name,
            price: coffee.price,
            image: coffee.image,
            index: index,
          ),
        );
      } catch (_) {
        return BlocProvider(
          create: (_) => PriceIconsBloc(),
          child: CoffeeCard(
            name: "Латте",
            price: 100.00,
            image: "assets/placeholder.jpg",
            index: 0,
          ),
        );
      }
    }, childCount: filteredProducts.length),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
    ),
  );
}
