import 'package:flutter/material.dart';
import '../globals.dart';
import 'package:coffeeshop/screens/coffee_menu.dart';

class ListCreator extends StatefulWidget {
  final double scrollOffset; 

  const ListCreator({Key? key, required this.scrollOffset}) : super(key: key);

  @override
  ListCreatorState createState() => ListCreatorState();
}


//это создание верхнего списка
class ListCreatorState extends State<ListCreator> {
  int selectedIndex = 0; 
  final ScrollController _ScrollController = ScrollController();
  final List<String> categories = [
    'Кофе с молоком', 'Черный кофе', 'Колд брю', 'Горячий шоколад', 'Чай'
  ];

void updateSelectedCategory(String categoryName) {
    final index = categories.indexOf(categoryName);
    if (index != -1 && index != selectedIndex) {
      setState(() {
        selectedIndex = index;
      });
    }
  }


  @override
Widget build(BuildContext context) {
    if (flag) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_ScrollController.hasClients) {
          _ScrollController.jumpTo(pos1 / deltaPos);
        }
      });
      return Transform.translate(
        offset: Offset(0,0),
    child: ListView(
      controller: _ScrollController,
      scrollDirection: Axis.horizontal, 
      children: [
        Row(
          children: categories.map((category) {
            int index = categories.indexOf(category);
            bool isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  scrollableFlag = false;
                  selectedIndex = index;
                });
                final CoffeeMenuState? parentState = context.findAncestorStateOfType<CoffeeMenuState>();
                if (parentState != null) {
                  final categoryName = categories[index];
                  final targetKey = parentState.categoryKeys[categoryName];
                  if (targetKey != null) {
                    Scrollable.ensureVisible(
                      targetKey.currentContext!,
                      duration: Duration(milliseconds: 700) 
                    );
                  }
                }
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
                  category,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            );
          }).toList(),
        ),]
      )
    );}
  else {
    return Transform.translate(
    offset: Offset(0,0),
    child: ListView(
      controller: _ScrollController,
      scrollDirection: Axis.horizontal, 
      children: [
        Row(
          children: categories.map((category) {
            int index = categories.indexOf(category);
            bool isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () async {
                setState(() {
                  scrollableFlag = false;
                  selectedIndex = index;
                });
                final CoffeeMenuState? parentState = context.findAncestorStateOfType<CoffeeMenuState>();
                if (parentState != null) {
                  final categoryName = categories[index];
                  final targetKey = parentState.categoryKeys[categoryName];
                  if (targetKey != null) {
                    await Scrollable.ensureVisible(
                      targetKey.currentContext!,
                      duration: Duration(milliseconds: 700),
                    );
                    setState(() {
                      scrollableFlag = true;
                  });
                  }
                }
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
                  category,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),]
      )
    );
  }
}}