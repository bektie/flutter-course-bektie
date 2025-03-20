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
  int selectedIndex = 0; 

  final List<String> categories = [
    'Кофе с молоком', 'Чай', 'Черный кофе', 'Горячий шоколад'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListCreator()
          ),
      body: 
      SingleChildScrollView(
        child: Column(
          children: [
          Container(
            child: Padding(padding: EdgeInsets.all(16),
            child: Column(
              children: [
                CustomTextWidget(text: 'Кофе с молоком'),
                coffeeGridBuilder(context),
                CustomTextWidget(text: 'Чай'),
                coffeeGridBuilder(context),
                CustomTextWidget(text: 'Черный кофе'),
                coffeeGridBuilder(context),
                CustomTextWidget(text: 'Горячий шоколад'),
                coffeeGridBuilder(context),
                CustomTextWidget(text: 'Авторские напитки'),
                coffeeGridBuilder(context),
                CustomTextWidget(text: 'Рафы'),
                coffeeGridBuilder(context),
                CustomTextWidget(text: 'Колд брю'),
                coffeeGridBuilder(context),
                CustomTextWidget(text: 'еще что нибудь'),
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


//задает свойства для контейнеров содержащих карточку с кофе
Widget coffeeGridBuilder(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 2, //реализовать позже функцию ввода,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20 
        ), 
        itemBuilder: (context, index) {
          return buildCoffeeCard('1','1','1');
      }
      );
  }

//создает карточку кофе
Widget buildCoffeeCard(String name, String price, String image) {
  return Container(
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
        padding: EdgeInsets.only(top: 16),
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

//listcreator для создания списка вынес отдельно
class ListCreator extends StatefulWidget {
  @override
  _ListCreatorState createState() => _ListCreatorState();
}

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