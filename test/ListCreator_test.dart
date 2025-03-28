import 'package:flutter_test/flutter_test.dart';



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



  test("", () {




  });
}