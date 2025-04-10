import 'package:coffeeshop/data/items.dart';
import 'package:flutter/material.dart';
import 'package:coffeeshop/globals.dart';
import 'package:coffeeshop/widgets/ListCreator.dart';
import '/widgets/CustomTextWidget.dart';
import 'package:coffeeshop/data/builders.dart';
import 'package:coffeeshop/widgets/basket.dart';


class CoffeeMenu extends StatefulWidget {
  const CoffeeMenu({super.key});
  
  
  @override
  CoffeeMenuState createState() => CoffeeMenuState();
  
}

class CoffeeMenuState extends State<CoffeeMenu> {
  final GlobalKey<ListCreatorState> listCreatorKey = GlobalKey<ListCreatorState>();
  final ScrollController _ScrollController1 = ScrollController();


  final double scrollOffset = 0; 

  late Map<String, GlobalKey> categoryKeys;

  @override
  void initState() {
    super.initState();
    categoryKeys = {
      for (var name in categories.values) name: GlobalKey()
    };
  }

  @override
  Widget build(BuildContext context) {
    
     _ScrollController1.addListener(() {
     /*pos1  = _ScrollController1.position.pixels;
      if (scrollableFlag) {
    if (pos1 < 91.5) {
      listCreatorKey.currentState?.updateSelectedCategory('Кофе с молоком');
    }
    if (pos1 < 408 && pos1 > 143.0) {
      listCreatorKey.currentState?.updateSelectedCategory('Черный кофе');
    }
    if (pos1 < 570.0&&pos1>408.0) {
      listCreatorKey.currentState?.updateSelectedCategory('Колд брю');
    }
    if (pos1 < 689.0&&pos1>570.0) {
      listCreatorKey.currentState?.updateSelectedCategory('Горячий шоколад');
    } 
    if (pos1 > 689.0) {
      listCreatorKey.currentState?.updateSelectedCategory('Чай');
    }
      }*/ //РЕАЛИЗОВАТЬ ПРОКРУТКУ СПИСКА ДИНАМИЧЕСКИ
  });
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 246, 255),
      body: Stack(
        children: [
          CustomScrollView(
            controller: _ScrollController1,
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
                    child: Center(child: ListCreator(key: listCreatorKey, scrollOffset: scrollOffset)), 
                  ),
              ),
              ),
              for (var entry in categories.entries) ...[
                SliverToBoxAdapter(
                  child: Container(
                    key: categoryKeys[entry.value],
                    child: CustomTextWidget(text: entry.value),
                  ),
                ),
                builderGridSliverUniversal(entry.key ?? 0, categorizedItems[entry.key]?.length ?? 0),
              ],
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Basket() 
          ),
        ],
      ),
    );
  }
}