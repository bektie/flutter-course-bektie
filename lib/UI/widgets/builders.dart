import 'package:coffeeshop/UI/widgets/coffee_card.dart';
import 'package:coffeeshop/data/models/product_model.dart';
import 'package:flutter/material.dart';


  SliverGrid builderGridSliverUniversal(int categoryId, int itemCount, List<ProductModel> products) {
    dynamic filteredProducts = products
      .where((product) => product.categoryId == categoryId)
      .toList();

  return SliverGrid(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        try {
          final coffee = filteredProducts[index];
          return CoffeeCard(
            name: coffee.name,
            price: coffee.price,
            image: coffee.image,
            index: index,
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
      childCount: filteredProducts.length,
    ),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
    ),
  );
}
