import 'package:flutter/material.dart';
import 'package:coffeeshop/globals.dart';
import 'package:coffeeshop/data/builders.dart';


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
    
     _ScrollController1.addListener(() {});
    
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