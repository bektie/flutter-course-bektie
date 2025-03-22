import 'package:flutter/material.dart';
import 'dart:math'; // Добавь в начало файла

void main() {
  runApp(MaterialApp(home: CoffeeMenu()));
}

class CoffeeMenu extends StatefulWidget {
  const CoffeeMenu({super.key});
  
  @override
  _CoffeeMenuState createState() => _CoffeeMenuState();
  
}

class _CoffeeMenuState extends State<CoffeeMenu> {

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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 246, 255),
      body: NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          setState(() {
            scrollOffset = notification.metrics.pixels; 
          });
        }
        return false; // false чтобы не останавливать дальнейшую обработку
      }, 
      child: CustomScrollView(
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
                child: Center(child: ListCreator(scrollOffset: scrollOffset)), 
              ),
          ),
          ),
          SliverToBoxAdapter(
            key: milkCoffeeKey,
            child: CustomTextWidget(text: "Кофе с молоком"),
          ),
          builderGridSliverMilkCoffee(2), 
          SliverToBoxAdapter(
            key: blackCoffeeKey,
            child: CustomTextWidget(text: "Черный кофе"),
          ),
          builderGridSliverBlackCoffee(2), 
          SliverToBoxAdapter(
            key: coldBrewKey,
            child: CustomTextWidget(text: "Колд брю"),
          ),
          builderGridSliverColdBrew(3),
          SliverToBoxAdapter(
            key: hotChocolateKey,
            child: CustomTextWidget(text: "Горячий шоколад"),
          ),
          builderGridSliverHotChoc(2), 
          SliverToBoxAdapter(
            key: teaKey,
            child: CustomTextWidget(text: "Чай"),
          ),
          builderGridSliverTea(2), 
        ],
      )
      )
     );
  }
}

//динамически позволяет менять число элементов в отдельной категории
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


class buildCoffeeCard extends StatefulWidget {
  final String name;
  final String price;
  final String image;
  final int index;

    const buildCoffeeCard(
      {super.key, required this.name, required this.price, required this.image, required this.index});

  @override
  State<buildCoffeeCard> createState() => _BuildCoffeeCardState();
}

class _BuildCoffeeCardState extends State<buildCoffeeCard> {
  bool showPriceIcons = false;
  @override
  Widget build(BuildContext context) {
  double indL = (widget.index % 2 == 0) ? 16 : 8; 
  double indR = (widget.index % 2 == 1) ? 16 : 8; 
  return Container(
    margin: EdgeInsets.only(top: 16, bottom: 16, left: indL, right: indR),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
          Align(
          alignment: Alignment.center,
          child: Image.asset(
          widget.image,
          width: 100,
          height: 100,
        ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding
          (
            padding: EdgeInsets.only(bottom: 4),
            child: Text(widget.name, style: TextStyle(fontWeight: FontWeight.bold))
          ),
        ),
        SizedBox(
          width: 116,
          height: 24,
          child:  Padding(
            padding: EdgeInsets.only(left: 0),
          child: showPriceIcons
            ? PriceIcons()
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue[200]
                ),
                child: Text(widget.price, style: TextStyle(color: Colors.white),),
                onPressed: () {
                  setState(() {
                    showPriceIcons = true;
                  });
                },
              )
            )
        )
      ],
    ),
  );
}
  }



class PriceIcons extends StatefulWidget {

  @override
  _PriceIconsState createState() => _PriceIconsState();
}

class _PriceIconsState extends State<PriceIcons>{
  int counterPrice = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.only(bottom: 10),
          onPressed: () {
            setState(() {
              if (counterPrice == 1) {
                counterPrice = 0;
                final parent = context.findAncestorStateOfType<_BuildCoffeeCardState>();
                parent?.setState(() {
                  parent.showPriceIcons = false;
                });
              }
              else {
              counterPrice--;
              }
            });
          },
          icon: Icon(Icons.remove),
        ),
        SizedBox(
          width: 30,
          height: 24,
          child: SizedBox(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue[200],
                borderRadius: BorderRadius.circular(15)
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 2),
                child: Text(counterPrice.toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
            )
            )
          ),
        ),
        IconButton(
          padding: EdgeInsets.only(bottom: 10),
          onPressed: () {
            setState(() {
              if (counterPrice == 10) {
                counterPrice = 10;
              }
              else {
              counterPrice++;
              }
            });
          },
          icon: Icon(Icons.add),
        ),
      ] 
    );
  }
}


class CoffeeItem {
  final String name;
  final String price;
  final String image;

  CoffeeItem({required this.name, required this.price, required this.image});
}

final List<CoffeeItem> milkCoffeeItems = [
  CoffeeItem(name: "ЛАТТЕ", price: "249RUB", image: "assets/latte.jpg"),
  CoffeeItem(name: "КАПУЧИНО", price: "249RUB", image: "assets/capuccino.png"),
];
final List<CoffeeItem> blackCoffeeItems = [
  CoffeeItem(name: "АМЕРИКАНО", price: "139RUB", image: "assets/americano.jpg"),
  CoffeeItem(name: "ЭСПРЕССО", price: "149RUB", image: "assets/espresso.jpg"),
];
final List<CoffeeItem> coldBrewCoffeeItems = [
  CoffeeItem(name: "КОЛД БРЮ", price: "449RUB", image: "assets/coldbrew.jpg"),
  CoffeeItem(name: "КОЛД БРЮ С ВИШНЕЙ", price: "409RUB", image: "assets/coldbrewCherry.jpg"),
  CoffeeItem(name: "НИТРО", price: "349RUB", image: "assets/nitro.jpg"),
];
final List<CoffeeItem> hotChocCoffeeItems = [
  CoffeeItem(name: "КАКАО", price: "129RUB", image: "assets/cacao.jpg"),
  CoffeeItem(name: "ГОРЯЧИЙ ШОКОЛАД", price: "199RUB", image: "assets/hotchoc.jpg"),];
final List<CoffeeItem> teaItems = [
  CoffeeItem(name: "ШИПОВНИК", price: "209RUB", image: "assets/teaShip.jpg"),
  CoffeeItem(name: "ОБЛЕПИХОВЫЙ", price: "209RUB", image: "assets/teaOblepiha.jpg"),];


//создает текст заголовков
class CustomTextWidget extends StatelessWidget {
  final String text;

  const CustomTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(top: 16, left: 8),
        child: Text(
     text,
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold
            )
          ),
         )
       );
  }
}


class ListCreator extends StatefulWidget {
  final double scrollOffset; 

  const ListCreator({Key? key, required this.scrollOffset}) : super(key: key);

  @override
  _ListCreatorState createState() => _ListCreatorState();
}



//это создание верхнего списка
class _ListCreatorState extends State<ListCreator> {
  int selectedIndex = 0; 
  final List<String> categories = [
    'Кофе с молоком', 'Черный кофе', 'Колд брю', 'Горячий шоколад', 'Чай'
  ];

  @override
Widget build(BuildContext context) {
  return Transform.translate(
    offset: Offset(-min(widget.scrollOffset, 30).toDouble(), 0),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal, 
      child: Container(
        height: 50, 
        child: Row(
          children: categories.map((category) {
            int index = categories.indexOf(category);
            bool isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });

                final _CoffeeMenuState? parentState = context.findAncestorStateOfType<_CoffeeMenuState>();
                if (parentState != null) {
                  final categoryName = categories[index];
                  final targetKey = parentState.categoryKeys[categoryName];
                  if (targetKey != null) {
                    Scrollable.ensureVisible(
                      targetKey.currentContext!,
                      duration: Duration(milliseconds: 500),
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    ),
  );
}}