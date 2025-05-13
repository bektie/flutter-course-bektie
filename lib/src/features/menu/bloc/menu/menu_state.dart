part of 'menu_bloc.dart';

enum MenuStatus { progress, success, error, idle }

final class MenuState extends Equatable {
  final MenuStatus status;
  final List<CategoryModel> categories;
  final List<ProductModel> items;
  final List<LocationsModel> locations;
  final LocationsModel? selectedLocation;

  const MenuState({
    required this.status,
    required this.categories,
    required this.items,
    required this.locations,
    this.selectedLocation,
  });

  MenuState copyWith({
    List<CategoryModel>? categories,
    List<ProductModel>? items,
    List<LocationsModel>? locations,
    MenuStatus? status,
    LocationsModel? selectedLocation,
  }) {
    return MenuState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      items: items ?? this.items,
      locations: locations ?? this.locations,
      selectedLocation: selectedLocation ?? this.selectedLocation,
    );
  }

  @override
  String toString() {
    return '''MenuStatus { status: $status, categories: ${categories.length}, items: ${items.length} }''';
  }

  @override
  List<Object?> get props => [
    status,
    categories,
    items,
    locations,
    selectedLocation,
  ];
}
