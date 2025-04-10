import 'package:coffeeshop/UI/widgets/coffee_card.dart';
import 'package:coffeeshop/data/items.dart';
import 'package:flutter/material.dart';


  SliverGrid builderGridSliverUniversal(int categoryId, int itemCount) {
  return SliverGrid(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        try {
          final coffeeIndex = index % items.length;
          final coffee = products;
          return CoffeeCard(
            name: coffee.name,
            price: coffee.price,
            image: coffee.image,
            index: coffeeIndex,
          );
        } catch (_) {
          return CoffeeCard(
            name: "Латте",
            price: "100",
            image: "assets/placeholder.jpg",
            index: 0,
          );
        }
      },
      childCount: itemCount,
    ),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
    ),
  );
}
