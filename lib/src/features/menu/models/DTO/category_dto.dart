class CategoryDto {
  final int id;
  final String slug;

  CategoryDto({required this.id, required this.slug});

  factory CategoryDto.fromJson(Map<String, dynamic> json) {
    return CategoryDto(id: json['id'] ?? '', slug: json['slug'] ?? '');
  }
}
