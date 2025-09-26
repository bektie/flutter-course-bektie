class ProductDTO {
  final int id;
  final String name;
  final String image;
  final double price;
  final int categoryId;

  ProductDTO({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.categoryId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'prices': [
        {'value': price.toString()},
      ],
      'category': {'id': categoryId},
    };
  }

  factory ProductDTO.fromJson(Map<String, dynamic> json) {
    return ProductDTO(
      id: json['id'],
      name: json['name'],
      image: json['imageUrl'] ?? '0',
      price: double.parse(json['prices'][0]['value']),
      categoryId: json['category']['id'],
    );
  }

  Map<String, dynamic> toDbJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'categoryId': categoryId,
    };
  }

  factory ProductDTO.fromDbJson(Map<String, dynamic> json) {
    return ProductDTO(
      id: json['id'],
      name: json['name'],
      image: json['imageUrl'] ?? '0',
      price: json['price'],
      categoryId: json['categoryId'],
    );
  }
}
