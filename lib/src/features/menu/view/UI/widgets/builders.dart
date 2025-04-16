import 'package:coffeeshop/src/features/menu/models/models/category_model.dart';
import 'package:coffeeshop/src/features/menu/models/models/product_model.dart';
import 'package:coffeeshop/src/features/menu/view/UI/widgets/coffee_card.dart';
import 'package:flutter/material.dart';

class BuilderGrid extends StatelessWidget {
  final CategoryModel category;
  final List<ProductModel> products;
  const BuilderGrid({
    super.key,
    required this.products,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            category.slug,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            mainAxisExtent: 196,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return CoffeeCard(product: products[index]);
          },
        ),
      ],
    );
  }
}
