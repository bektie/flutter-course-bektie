import 'package:bloc/bloc.dart';
import 'package:coffeeshop/src/features/menu/bloc/states/list_state.dart';

abstract class ListEvent {}

class Tapped extends ListEvent {
  final int index;
  Tapped(this.index);
}

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListSelected(-1)) {
    on<Tapped>((event, emit) {
      emit(ListSelected(event.index));
    });
  }
}
