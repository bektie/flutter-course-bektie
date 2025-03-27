import 'package:coffeeshop/widgets/ListCreator.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  test('updateSelectedCategory is updates this category', () async {
    final ListCreatorState listCreatorState = ListCreatorState();
    listCreatorState.updateSelectedCategory('Кофе с молоком');
    expect(listCreatorState.selectedIndex, 0);
  });
}