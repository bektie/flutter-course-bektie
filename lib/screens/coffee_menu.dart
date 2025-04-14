import 'package:flutter/material.dart';
import 'package:coffeeshop/globals.dart';
import 'package:coffeeshop/widgets/ListCreator.dart';
import '/widgets/CustomTextWidget.dart';
import 'package:coffeeshop/data/builders.dart';


class CoffeeMenu extends StatefulWidget {
  const CoffeeMenu({super.key});
  
  
  @override
  CoffeeMenuState createState() => CoffeeMenuState();
  
}

class CoffeeMenuState extends State<CoffeeMenu> {
  final GlobalKey<ListCreatorState> listCreatorKey = GlobalKey<ListCreatorState>();
  final ScrollController _ScrollController1 = ScrollController();
  final GlobalKey milkCoffeeKey = GlobalKey();
  final GlobalKey blackCoffeeKey = GlobalKey();
  final GlobalKey coldBrewKey = GlobalKey();
  final GlobalKey hotChocolateKey = GlobalKey();
  final GlobalKey teaKey = GlobalKey();

  double scrollOffset = 0; 

  late Map<String, GlobalKey> categoryKeys;

  @override
  void initState() {
    super.initState();
    categoryKeys = {
      'Кофе с молоком': milkCoffeeKey,
      'Черный кофе': blackCoffeeKey,
      'Колд брю': coldBrewKey,
      'Горячий шоколад': hotChocolateKey,
      'Чай': teaKey,
    };
  }

  @override
  Widget build(BuildContext context) {
    
     _ScrollController1.addListener(() {
     pos1  = _ScrollController1.position.pixels;
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
      }

  });
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 246, 255),
      body: NotificationListener<ScrollNotification>(
      child: CustomScrollView(
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
          SliverToBoxAdapter(
            child: Container(
              key: milkCoffeeKey,
              child: CustomTextWidget(text: "Кофе с молоком"),
            ),
          ),
          builderGridSliverMilkCoffee(2), 
          SliverToBoxAdapter(
            child: Container(
              key: blackCoffeeKey,
              child: CustomTextWidget(text: "Черный кофе"),
            ),
          ),
          builderGridSliverBlackCoffee(2), 
          SliverToBoxAdapter(
            child: Container(
              key: coldBrewKey,
              child: CustomTextWidget(text: "Колд брю"),
            ),
          ),
          builderGridSliverColdBrew(3),
          SliverToBoxAdapter(
            child: Container(
              key: hotChocolateKey,
              child: CustomTextWidget(text: "Горячий шоколад"),
            ),
          ),
          builderGridSliverHotChoc(2), 
          SliverToBoxAdapter(
            child: Container(
              key: teaKey,
              child: CustomTextWidget(text: "Чай"),
            ),
          ),
          builderGridSliverTea(2), 
        ],
      ),

        onNotification: (notification) 
        {
          setState(() {
          if (notification.metrics.axis == Axis.vertical) {
          flag = true;
         }
          else if (notification.metrics.axis == Axis.horizontal)
        {
          flag = false;
        }
        } 
        );
        return false;
        }
     )
    );
  }
}
