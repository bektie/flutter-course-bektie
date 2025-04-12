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
    required this.categoryId
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) {
    return ProductDTO(
      id: json['id'],
      name: json['name'],
      image: json['imageUrl'],
      price: double.tryParse(json['prices']?[0]?['value']?.toString() ?? '') ?? 0.0,
      categoryId: json['category']['id']
    );
  }
}
