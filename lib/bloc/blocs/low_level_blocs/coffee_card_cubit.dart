import 'package:bloc/bloc.dart';

abstract class PriceIconsState {}
class ShowPriceIcons extends PriceIconsState {}
class HidePriceIcons extends PriceIconsState {}

class PriceIconsBloc extends Cubit<PriceIconsState> {
  PriceIconsBloc() : super(HidePriceIcons());

  void show() => emit(ShowPriceIcons());
  void hide() => emit(HidePriceIcons());
}