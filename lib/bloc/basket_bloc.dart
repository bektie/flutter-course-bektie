import 'package:bloc/bloc.dart';

abstract class BasketEvent {}

class AddBasketPrice extends BasketEvent {
  double price;
  AddBasketPrice(this.price);
}

class BasketBloc extends Bloc<BasketEvent, double> {
  BasketBloc() : super(0) {
    on<AddBasketPrice>((event, emit) {
      if (state < 10000) {
        emit(state + event.price);
        }
      }
    );
  }
}