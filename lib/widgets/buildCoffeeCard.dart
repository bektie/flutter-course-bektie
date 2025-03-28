import 'package:flutter/material.dart';
import 'PriceIcons.dart';

class buildCoffeeCard extends StatefulWidget {
  
  final String name;
  final String price;
  final String image;
  final int index;

    const buildCoffeeCard(
      {super.key, required this.name, required this.price, required this.image, required this.index});

  @override
  State<buildCoffeeCard> createState() => BuildCoffeeCardState();
}

class BuildCoffeeCardState extends State<buildCoffeeCard> {
  final transit = GlobalKey();
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
              key: Key('transit'),
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



