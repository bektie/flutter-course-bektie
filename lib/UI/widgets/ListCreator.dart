import 'package:coffeeshop/bloc/blocs/top_level_blocs/category_bloc.dart';
import 'package:coffeeshop/bloc/states/category_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ListCreator extends StatelessWidget {

  ListCreator(categories, {super.key});

  @override
Widget build(BuildContext context) {
    
  return BlocBuilder<CategoryBloc, CategoryState>(
    builder: (context, state) {

    bool isSelected = false;

    if (state is CategoryLoaded) {
      final categories = state.categories;
      return ListView(
        scrollDirection: Axis.horizontal,
        children: categories.map((cat) {
          return ElevatedButton(
            onPressed: () {
              isSelected = true;
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.lightBlue[200] : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Text(
                  cat.slug,
                  key: Key('category_$cat.slug'),
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          );
        }).toList(),
      );
    }
    return CircularProgressIndicator();
  },
);
  }
}