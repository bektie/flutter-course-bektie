import 'package:coffeeshop/data/api.dart';

class CoffeeItem {
  final int categoryId;
  final int id;
  final String name;
  final String price;
  final String image;

  CoffeeItem({
    required this.categoryId,
    required this.id,
    required this.name,
    required this.price,
    required this.image
  });

  @override
  String toString() {
    return 'CoffeeItem(id: $id, name: $name, price: $price, image: $image)';
  }
}

Map<int, List<CoffeeItem>> categorizedItems = localCategorizedItems;
