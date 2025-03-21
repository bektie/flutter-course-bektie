import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: CoffeeMenu()));
}

class CoffeeMenu extends StatefulWidget {
  const CoffeeMenu({super.key});
  @override
  _CoffeeMenuState createState() => _CoffeeMenuState();
}

class _CoffeeMenuState extends State<CoffeeMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 246, 255),
      body: CustomScrollView(
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
                child: Center(child: ListCreator()),
              ),
          ),
          ),
          SliverToBoxAdapter(
            child: CustomTextWidget(text: "Кофе с молоком"),
          ),
          builderGridSliver(2),
          SliverToBoxAdapter(
            child: CustomTextWidget(text: "Черный кофе"),
          ),
          builderGridSliver(3),
          SliverToBoxAdapter(
            child: CustomTextWidget(text: "Колд брю"),
          ),
          builderGridSliver(4),
          SliverToBoxAdapter(
            child: CustomTextWidget(text: "Горячий шоколад"),
          ),
          builderGridSliver(2),
          SliverToBoxAdapter(
            child: CustomTextWidget(text: "Чай"),
          ),
          builderGridSliver(2),
        ],
      )
      );
  }
}

//динамически позволяет менять число элементов в отдельной категории
SliverGrid builderGridSliver(int itemCount) {
  return SliverGrid(delegate: SliverChildBuilderDelegate((context, index)
          {
            return buildCoffeeCard('', '', '', index);
          }, 
          childCount: itemCount
          ), 
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8
            )
          );
}

//создает карточку кофе
Widget buildCoffeeCard(String name, String price, String image, int index) {
  double indL = 0;
  double indR = 0;
  if (index % 2 == 0) {
    indL = 16; 
  }
  else 
  {
    indR = 16;
  }
  return Container(
    margin: EdgeInsets.only(top: 16, left: indL, right: indR),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15)
    ),
    child: Text('123123')
  );
}

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

//listcreator для создания списка 
class ListCreator extends StatefulWidget {
  @override
  _ListCreatorState createState() => _ListCreatorState();
}

//это создание верхнего списка
//реализовать физику телепорта к катгеории
class _ListCreatorState extends State<ListCreator> {
  int selectedIndex = 0; 
  final List<String> categories = [
    'Кофе с молоком', 'Чай', 'Черный кофе', 'Горячий шоколад'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
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
                categories[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}