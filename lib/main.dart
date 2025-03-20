import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: CoffeeMenu()));
}

class CoffeeMenu extends StatefulWidget {
  @override
  _CoffeeMenuState createState() => _CoffeeMenuState();
}

class _CoffeeMenuState extends State<CoffeeMenu> {
  int selectedIndex = 0; // Индекс активного элемента

  final List<String> categories = [
    'Черный кофе', 'Кофе с молоком', 'Чай', 'Авторские напитки'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
              height: 50, // Высота контейнера с кнопками
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Горизонтальный скролл
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
            ),
          ),
      body: 
      SingleChildScrollView(
        child: Column(
          children: [
          Container(
            child: Padding(padding: EdgeInsets.all(16),
            child: Column(
              children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(padding: EdgeInsets.only(top: 16),
                    child: Text('Черный кофе',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold
                      )
                  ),
                  )
                ),
                coffeeGridBuilder(context),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(padding: EdgeInsets.only(top: 16),
                    child: Text('Кофе с молоком',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold
                      )
                  ),
                  )
                ),
                coffeeGridBuilder(context),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(padding: EdgeInsets.only(top: 16),
                    child: Text('Чай',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold
                      )
                  ),
                  )
                ),
                coffeeGridBuilder(context),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(padding: EdgeInsets.only(top: 16),
                    child: Text('Горячий шоколад',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold
                      )
                  ),
                  )
                ),
                coffeeGridBuilder(context),
            ],
          ),
        )
        )
          ],
      )
      )
      );
  }
}

Widget coffeeGridBuilder(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 2, //реализовать позже функцию ввода,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
        crossAxisSpacing: 20
        ), 
        itemBuilder: (context, index) {
          return buildCoffeeCard('1','1','1');
      }
      );
  }

Widget buildCoffeeCard(String name, String price, String image) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15)
    ),
    child: Text('123123')
  );
}

Widget upperList() {
  return Row(
    children: List.generate(4, (index) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 1),
        child: IconButton(
          icon: Icon(Icons.coffee),
          onPressed: () {},
        ),
      );
    }),
  );
}