part of 'menu_bloc.dart';

enum MenuStatus { progress, success, error, idle }

final class MenuState extends Equatable {
  final MenuStatus status;
  final List<CategoryModel> categories;
  final List<ProductModel> items;
  final List<LocationsModel> locations;

  const MenuState({
    required this.status,
    required this.categories,
    required this.items,
    required this.locations,
  });

  MenuState copyWith({
    List<CategoryModel>? categories,
    List<ProductModel>? items,
    List<LocationsModel>? locations,
    MenuStatus? status,
  }) {
    return MenuState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      items: items ?? this.items,
      locations: locations ?? this.locations,
    );
  }

  @override
  String toString() {
    return '''MenuStatus { status: $status, categories: ${categories.length}, items: ${items.length} }''';
  }

  @override
  List<Object?> get props => [status, categories, items, locations];
}
