import 'package:flutter/material.dart';
import 'buildCoffeeCard.dart';
import 'package:coffeeshop/bloc/basket_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceIcons extends StatefulWidget {

  @override
  PriceIconsState createState() => PriceIconsState();
}

class PriceIconsState extends State<PriceIcons>{
  
  @override
  Widget build(BuildContext context) {
    var parent = context.findAncestorStateOfType<BuildCoffeeCardState>();
    int counterPrice = parent!.counterPrice;
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.only(bottom: 10),
          onPressed: () {
            setState(() {
              if (parent.counterPrice == 1) {
                parent.counterPrice = 0;
                parent.setState(() {
                  parent.showPriceIcons = false;
                });
              }
              else {
              counterPrice--;
              final parent = context.findAncestorStateOfType<BuildCoffeeCardState>();
              double price = parent!.price;
              context.read<BasketBloc>().add(DeleteBasketPrice(price));
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
                child: Text(parent.counterPrice.toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
            )
            )
          ),
        ),
        IconButton(
          padding: EdgeInsets.only(bottom: 10),
          onPressed: () {
            setState(() {
              if (parent.counterPrice == 10) {
                parent.counterPrice = 10;
              }
              else {
                counterPrice++;
              final parent = context.findAncestorStateOfType<BuildCoffeeCardState>();
              double price = parent!.price;
              context.read<BasketBloc>().add(SetBasketPrice(price, counterPrice));
              }
            });
          },
          icon: Icon(Icons.add),
        ),
      ] 
    );
  }
}



