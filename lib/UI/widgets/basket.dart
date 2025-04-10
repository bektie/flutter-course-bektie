import 'package:coffeeshop/bloc/blocs/basket_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Basket extends StatelessWidget {

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
              child: BlocBuilder<BasketBloc, BasketState>(
                builder: (context, state) {
                  return Text(
                    state.totalPrice.toStringAsFixed(2),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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
