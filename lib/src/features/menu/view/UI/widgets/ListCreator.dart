import 'package:coffeeshop/src/features/menu/bloc/blocs/low_level_blocs/list_bloc.dart';
import 'package:coffeeshop/src/features/menu/bloc/blocs/top_level_blocs/category_bloc.dart';
import 'package:coffeeshop/src/features/menu/bloc/states/category_state.dart';
import 'package:coffeeshop/src/features/menu/bloc/states/list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCreator extends StatelessWidget {
  const ListCreator(categories, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoaded) {
          final categories = state.categories;
          return SizedBox(
            height: 45,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children:
                  categories.asMap().entries.map((entry) {
                    final index = entry.key;
                    final cat = entry.value;
                    return BlocBuilder<ListBloc, ListState>(
                      builder: (BuildContext context, ListState state) {
                        final isSelected = state.selectedIndex == index;
                        return GestureDetector(
                          onTap: () {
                            context.read<ListBloc>().add(Tapped(index));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  isSelected
                                      ? Colors.lightBlue[200]
                                      : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Text(
                              cat.slug,
                              key: Key('category_${cat.slug}'),
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
