class ProductModel {
  final int id;
  final String name;
  final double price;
  final String image;
  final int categoryId;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.categoryId,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'categoryId': categoryId,
    };
  }
}
