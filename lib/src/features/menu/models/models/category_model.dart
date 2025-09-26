class CategoryModel {
  final int id;
  final String slug;

  const CategoryModel({required this.id, required this.slug});

  Map<String, Object?> toMap() {
    return {'id': id, 'slug': slug};
  }
}
