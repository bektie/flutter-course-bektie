import 'package:coffeeshop/globals.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:coffeeshop/widgets/ListCreator.dart';
import 'package:coffeeshop/screens/coffee_menu.dart';



void main() {
  test('updateSelectedCategory is updates this category', () {
    //arrange
    final List<String> categories = [
    'Кофе с молоком', 'Черный кофе', 'Колд брю', 'Горячий шоколад', 'Чай'
  ];
  int selectedIndex = 0;
    //act
    int updateSelectedCategory(String categoryName) {
    final index = categories.indexOf(categoryName);
    if (index != -1 && index != selectedIndex) {
      selectedIndex = index;
      return index;
    }
    else {
      return -1;
    }
  }
    //assert
    expect(updateSelectedCategory('Чай'),4);
    
  });


  testWidgets('if scrolling selectedindex are changing', (tester) async {
  //arrange
  //act
  await tester.pumpWidget(MaterialApp(home: CoffeeMenu()));
  await tester.drag(find.byType(CustomScrollView), const Offset(0, -450));
  await tester.pumpAndSettle();
  final listCreatorState = tester.state<ListCreatorState>(find.byType(ListCreator));
  //assert
  expect(listCreatorState.selectedIndex, 2); 
});


  testWidgets('is ignites a category on tap', (tester) async {
    await tester.pumpWidget(MaterialApp(home: CoffeeMenu()));

    await tester.tap(find.text('Черный кофе').first);
    await tester.pumpAndSettle();

    final textWidget = tester.widget<Text>(find.byKey(Key('category_Черный кофе')));
    final textColor = textWidget.style?.color;

    expect(textColor, equals(Colors.white)); 
  });


  testWidgets('when scrolling it changes a flag', (tester) async {
    await tester.pumpWidget(MaterialApp(home: CoffeeMenu()));
    
    await tester.drag(
      find.byType(ListView),
      const Offset(0, -1),        
    );
    await tester.pumpAndSettle();

    expect(flag, true);
  });


  testWidgets('listview scroll independent of slivergridScroll', (tester) async {
    await tester.pumpWidget(MaterialApp(home: CoffeeMenu()));
    
    await tester.drag(
      find.byType(ListView),
      const Offset(0, -100),        
    );
      expect(flag, true);
  });

}