import 'package:coffeeshop/src/features/menu/bloc/blocs/low_level_blocs/basket_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'PriceIcons.dart';
import 'package:coffeeshop/src/features/menu/bloc/blocs/low_level_blocs/coffee_card_cubit.dart';

class CoffeeCard extends StatelessWidget {
  final String name;
  final double price;
  final String image;
  final num index;

  const CoffeeCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BasketBloc(),
      child: Container(
        padding: const EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
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
              child:
                  image.startsWith('http')
                      ? Image.network(image, width: 100, height: 100)
                      : Image.asset(image, width: 100, height: 100),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              width: 116,
              height: 24,
              child: Padding(
                padding: const EdgeInsets.only(left: 0),
                child: BlocBuilder<PriceIconsBloc, PriceIconsState>(
                  builder: (context, state) {
                    if (state is ShowPriceIcons) {
                      return PriceIcons();
                    } else {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue[200],
                        ),
                        child: Text(
                          price.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          context.read<PriceIconsBloc>().show();
                          final parsedPrice = price;
                          context.read<BasketBloc>().add(
                            AddToBasket(parsedPrice),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
