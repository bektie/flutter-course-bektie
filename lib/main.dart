import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: CoffeeMenu()));
}

class CoffeeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(237, 230, 248, 252),
      body: SingleChildScrollView( 
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