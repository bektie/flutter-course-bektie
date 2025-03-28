import 'package:coffeeshop/screens/coffee_menu.dart';
import 'package:coffeeshop/widgets/PriceIcons.dart';
import 'package:flutter/material.dart';
import 'package:coffeeshop/widgets/buildCoffeeCard.dart';
import 'package:flutter_test/flutter_test.dart';


void main () {
  testWidgets('counter is working', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PriceIcons(),
        ),
      ),
    );

    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('2'), findsOneWidget);


    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);


    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));

    await tester.pump();
    expect(find.text('10'), findsOneWidget);
  });

  testWidgets('transition is working', (tester) async {
    await tester.pumpWidget(MaterialApp(home: CoffeeMenu()));
    await tester.pumpAndSettle();

    final coffeeCardFinder = find.byType(buildCoffeeCard).first;
    final coffeeCardState = tester.state<BuildCoffeeCardState>(coffeeCardFinder);

    expect(coffeeCardState.showPriceIcons, isFalse);

    final button = find.byType(ElevatedButton).first;
    await tester.tap(button);
    await tester.pumpAndSettle();

    expect(coffeeCardState.showPriceIcons, isTrue);
  });
}