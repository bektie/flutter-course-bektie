import 'package:bloc/bloc.dart';

abstract class BasketEvent {}

class Increment extends BasketEvent {}

class Decrement extends BasketEvent {}

class BasketBloc extends Bloc<BasketEvent, int> {
  BasketBloc() : super(0) {
    on<Increment>((event, emit) {
      emit(state + 1);
    });

    on<Decrement>((event, emit) {
      emit(state > 0 ? state - 1 : 0);
    });
  }
}