import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:coffeeshop/src/features/menu/bloc/blocs/low_level_blocs/coffee_card_cubit.dart';
import 'package:coffeeshop/src/features/menu/bloc/blocs/low_level_blocs/price_icons_bloc.dart';

abstract class BasketEvent {}

class AddToBasket extends BasketEvent {
  final double price;
  AddToBasket(this.price);
}

class RemoveFromBasket extends BasketEvent {
  final double price;
  RemoveFromBasket(this.price);
}

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  double totalPrice = 0.0;
  final PriceIconsBloc priceBloc = PriceIconsBloc();

  BasketBloc() : super(BasketState(0.0)) {
    on<AddToBasket>((event, emit) {
      totalPrice += event.price;
      emit(BasketState(totalPrice));
    });

    on<RemoveFromBasket>((event, emit) {
      totalPrice -= event.price;
      emit(BasketState(totalPrice));
      if (PriceBloc().state == 0.0) {
        priceBloc.hide();
      }
    });
  }
}

class BasketState extends Equatable {
  final double totalPrice;

  BasketState(this.totalPrice);

  List<Object> get props => [totalPrice];
}
