import 'package:coffeeshop/widgets/buildCoffeeCard.dart';
import 'package:flutter/material.dart';
import 'items.dart';


  SliverGrid builderGridSliverUniversal(int categoryId, int itemCount) {
  final items = categorizedItems[categoryId] ?? [];

  return SliverGrid(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        if (items.isEmpty || items.length < itemCount) {
          return buildCoffeeCard(
            name: "Латте",
            price: "100",
            image: "assets/placeholder.jpg",
            index: 0,
          );
        }
        try {
          final coffeeIndex = index % items.length;
          final coffee = items[coffeeIndex];
          return buildCoffeeCard(
            name: coffee.name,
            price: coffee.price,
            image: coffee.image,
            index: coffeeIndex,
          );
        } catch (_) {
          return buildCoffeeCard(
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
