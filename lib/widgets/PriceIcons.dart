import 'package:flutter/material.dart';
import 'buildCoffeeCard.dart';

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
                final parent = context.findAncestorStateOfType<BuildCoffeeCardState>();
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
          width: 20,
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



