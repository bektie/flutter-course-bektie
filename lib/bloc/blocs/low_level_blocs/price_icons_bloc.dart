import 'package:bloc/bloc.dart';

abstract class PriceEvent {}

class Increment extends PriceEvent {}

class Decrement extends PriceEvent {}

class PriceBloc extends Bloc<PriceEvent, int> {
  PriceBloc() : super(0) {

    on<Increment>((event, emit) {
      emit(state + 1);
    });

    on<Decrement>((event, emit) {
      emit(state > 0 ? state - 1 : 0);
    });
  
  }
}