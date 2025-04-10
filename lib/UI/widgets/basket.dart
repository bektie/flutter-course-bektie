import 'package:coffeeshop/bloc/blocs/basket_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Basket extends StatefulWidget {
  const Basket({Key? key}) : super(key: key);

  @override
  _BasketState createState() => _BasketState();
}

class _BasketState extends State<Basket> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 60,
      child: FloatingActionButton(
        backgroundColor: Colors.lightBlue[200],
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_basket,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: BlocBuilder<BasketBloc, double>(
                builder: (context, state) {
                  return Text(
                    state.toStringAsFixed(2),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}