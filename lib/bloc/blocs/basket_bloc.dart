import 'package:bloc/bloc.dart';

abstract class BasketEvent {}

class SetBasketPrice extends BasketEvent {
  double price;
  int counterPrice;
  SetBasketPrice(this.price, this.counterPrice);
}

class DeleteBasketPrice extends BasketEvent {
  double price;
  DeleteBasketPrice(this.price);
}

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
      });
    on<SetBasketPrice>((event, emit) {
      emit(state + event.price * event.counterPrice);
    });
     on<DeleteBasketPrice>((event, emit) {
      emit(state - event.price);
    });
  }
}