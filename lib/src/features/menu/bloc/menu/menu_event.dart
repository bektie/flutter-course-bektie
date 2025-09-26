part of 'menu_bloc.dart';

@immutable
sealed class MenuEvent extends Equatable {
  const MenuEvent();
}

class LocationSelected extends MenuEvent {
  final LocationsModel location;

  const LocationSelected(this.location);

  @override
  String toString() => 'LocationSelected';
  @override
  List<Object> get props => [location];
}

class CategoryLoadingStarted extends MenuEvent {
  const CategoryLoadingStarted();

  @override
  String toString() => 'CategoryLoadingStarted';
  @override
  List<Object> get props => [];
}

class PageLoadingStarted extends MenuEvent {
  const PageLoadingStarted();

  @override
  String toString() => 'PageLoadingStarted';
  @override
  List<Object> get props => [];
}

class LocationsLoadingStarted extends MenuEvent {
  const LocationsLoadingStarted();

  @override
  String toString() => 'LocationsLoadingStarted';
  @override
  List<Object> get props => [];
}

class OneCategoryLoadingStarted extends MenuEvent {
  const OneCategoryLoadingStarted(this.category);
  final CategoryModel category;
  @override
  String toString() => 'OneCategoryLoadingStarted';
  @override
  List<Object> get props => [category];
}
