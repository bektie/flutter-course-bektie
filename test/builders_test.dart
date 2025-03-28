import 'package:coffeeshop/data/builders.dart';
import 'package:coffeeshop/data/items.dart';
import 'package:coffeeshop/screens/coffee_menu.dart';
import 'package:coffeeshop/widgets/buildCoffeeCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main () {
  testWidgets('is exists builder widgets after scrolling', (tester) async {
    await tester.pumpWidget(MaterialApp(home: CoffeeMenu()));
    int num = 0;
    

    final finder = find.byType(SliverGrid);
    num += finder.evaluate().length;
    
    await tester.drag(find.byType(CustomScrollView), const Offset(0, -200));
    
    final finder1 = find.byType(SliverGrid);
    num += finder1.evaluate().length;


    expect(num, greaterThanOrEqualTo(3));
  });


  testWidgets('checking for placeholder', (tester) async {
  milkCoffeeItems = [];

  await tester.pumpWidget(MaterialApp(
    home: CustomScrollView(
      slivers: [builderGridSliverMilkCoffee(2)],
    ),
  ));
  await tester.pumpAndSettle();

  final finder = find.byType(buildCoffeeCard).first;
  final widget = tester.widget<buildCoffeeCard>(finder);

  expect(widget.name, "Латте");
  expect(widget.image, "assets/placeholder.jpg");
});
}