import 'package:coffeeshop/UI/widgets/CustomTextWidget.dart';
import 'package:coffeeshop/UI/widgets/ListCreator.dart';
import 'package:coffeeshop/UI/widgets/basket.dart';
import 'package:coffeeshop/bloc/blocs/top_level_blocs/category_bloc.dart';
import 'package:coffeeshop/bloc/states/category_state.dart';
import 'package:coffeeshop/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:coffeeshop/UI/widgets/builders.dart';
import 'package:collection/collection.dart';
import 'package:coffeeshop/bloc/blocs/top_level_blocs/product_bloc.dart';
import 'package:coffeeshop/bloc/states/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<ProductModel> products = [];
dynamic categories = [];

class CoffeeMenu extends StatelessWidget {
  const CoffeeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CategoryBloc, CategoryState>(
          listener: (context, state) {
            if (state is CategoryLoaded) {
              categories = state.categories;
            }
          },
        )
      ],
      child: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductLoadedBase) {
            products = state.products;
          }
        },
        builder: (context, state) => Scaffold(
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
                  for (int i = 0;i<categories.length;i++)...{
                    SliverToBoxAdapter(
                    child: Container(
                      key: ValueKey(categories[i].id),
                      child: CustomTextWidget(text: categories[i].slug)
                    ),
                  ),
                  builderGridSliverUniversal(categories[i].id, 
                  (groupBy(products, (product) => product.categoryId)
                      .map((key, value) => MapEntry(key, value.length)))[categories[i].id] ?? 0,
                      products
                      )
                  }
                ],
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Basket(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}