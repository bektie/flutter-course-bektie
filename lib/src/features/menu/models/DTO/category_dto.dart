class CategoryDto {
  final int id;
  final String slug;

  CategoryDto({required this.id, required this.slug});

  Map<String, dynamic> toJson() {
    return {'id': id, 'slug': slug};
  }

  factory CategoryDto.fromJson(Map<String, dynamic> json) {
    return CategoryDto(
      id: (json['id'] as num).toInt(),
      slug: json['slug'] ?? '',
    );
  }
}
