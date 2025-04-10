import 'package:flutter/material.dart';
import 'package:coffeeshop/bloc/blocs/basket_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceIcons extends StatelessWidget {
  const PriceIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketBloc, int>(
      builder: (context, counter) {
        return Row(
          children: [
            IconButton(
              padding: EdgeInsets.only(bottom: 10),
              onPressed: () {
                context.read<BasketBloc>().add(Decrement());
              },
              icon: Icon(Icons.remove),
            ),
            SizedBox(
              width: 20,
              height: 24,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Text(
                    counter.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            IconButton(
              padding: EdgeInsets.only(bottom: 10),
              onPressed: () {
                context.read<BasketBloc>().add(Increment());
              },
              icon: Icon(Icons.add),
            ),
          ],
        );
      },
    );
  }
}