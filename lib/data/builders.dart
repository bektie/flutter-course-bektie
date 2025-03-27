import 'package:coffeeshop/widgets/buildCoffeeCard.dart';
import 'package:flutter/material.dart';
import 'items.dart';

SliverGrid builderGridSliverMilkCoffee(int itemCount) {
  return SliverGrid(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        if (milkCoffeeItems.length < itemCount) {
          return buildCoffeeCard(
            name: "Латте",
            price: "100",
            image: "assets/placeholder.jpg",
            index: 0,
          );
        }
        else {
        try {
        final coffeeIndex = index % milkCoffeeItems.length; 
        final coffee = milkCoffeeItems[coffeeIndex];
          return buildCoffeeCard(
            name: coffee.name,
            price: coffee.price,
            image: coffee.image,
            index: coffeeIndex,
          );
        }
        catch (IntegerDivisionByZeroException) { 
          final coffee = "assets/placeholder.jpg";
          return buildCoffeeCard(
            name: "Латте",
            price: "100",
            image: coffee,
            index: 0,
          );
        }
        }
      },
      childCount: itemCount,
    ),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
    ),
  );
}
SliverGrid builderGridSliverBlackCoffee(int itemCount) {
  return SliverGrid(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        if (blackCoffeeItems.length < itemCount) {
          return buildCoffeeCard(
            name: "Латте",
            price: "100",
            image: "assets/placeholder.jpg",
            index: 0,
          );
        }
        else {
        try {
        final coffeeIndex = index % blackCoffeeItems.length; 
        final coffee = blackCoffeeItems[coffeeIndex];
          return buildCoffeeCard(
            name: coffee.name,
            price: coffee.price,
            image: coffee.image,
            index: coffeeIndex,
          );
        }
        catch (IntegerDivisionByZeroException) { 
          final coffee = "assets/placeholder.jpg";
          return buildCoffeeCard(
            name: "Латте",
            price: "100",
            image: coffee,
            index: 0,
          );
        }
        }
      },
      childCount: itemCount,
    ),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
    ),
  );
}
SliverGrid builderGridSliverColdBrew(int itemCount) {
  return SliverGrid(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        if (coldBrewCoffeeItems.length < itemCount) {
          return buildCoffeeCard(
            name: "Латте",
            price: "100",
            image: "assets/placeholder.jpg",
            index: 0,
          );
        }
        else {
        try {
        final coffeeIndex = index % coldBrewCoffeeItems.length; 
        final coffee = coldBrewCoffeeItems[coffeeIndex];
          return buildCoffeeCard(
            name: coffee.name,
            price: coffee.price,
            image: coffee.image,
            index: coffeeIndex,
          );
        }
        catch (IntegerDivisionByZeroException) { 
          final coffee = "assets/placeholder.jpg";
          return buildCoffeeCard(
            name: "Латте",
            price: "100",
            image: coffee,
            index: 0,
          );
        }
        }
      },
      childCount: itemCount,
    ),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
    ),
  );
}
SliverGrid builderGridSliverHotChoc(int itemCount) {
  return SliverGrid(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        if (hotChocCoffeeItems.length < itemCount) {
          return buildCoffeeCard(
            name: "Латте",
            price: "100",
            image: "assets/placeholder.jpg",
            index: 0,
          );
        }
        else {
        try {
        final coffeeIndex = index % hotChocCoffeeItems.length; 
        final coffee = hotChocCoffeeItems[coffeeIndex];
        return buildCoffeeCard(
            name: coffee.name,
            price: coffee.price,
            image: coffee.image,
            index: coffeeIndex,
          );
        }
        catch (IntegerDivisionByZeroException) { 
          final coffee = "assets/placeholder.jpg";
          return buildCoffeeCard(
            name: "Латте",
            price: "100",
            image: coffee,
            index: 0,
          );
        }
        }
      },
      childCount: itemCount,
    ),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
    ),
  );
}
SliverGrid builderGridSliverTea(int itemCount) {
  return SliverGrid(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
      if (teaItems.length < itemCount) {
          return buildCoffeeCard(
            name: "Латте",
            price: "100",
            image: "assets/placeholder.jpg",
            index: 0,
          );
      }
        else {
        try {
        final coffeeIndex = index % teaItems.length; 
        final coffee = teaItems[coffeeIndex];
        return buildCoffeeCard(
            name: coffee.name,
            price: coffee.price,
            image: coffee.image,
            index: coffeeIndex,
          );
        }
        catch (IntegerDivisionByZeroException) { 
          final coffee = "assets/placeholder.jpg";
          return buildCoffeeCard(
            name: "Латте",
            price: "100",
            image: coffee,
            index: 0,
          );
        }
        }
      },
      childCount: itemCount,
    ),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
    ),
  );
}
