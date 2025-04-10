import 'package:coffeeshop/repositories/product_repository.dart';
import 'package:coffeeshop/repositories/category_repository.dart';

final categoryRepository = CategoryRepository();
final categories = categoryRepository.fetchCategories();

final productRepository = ProductRepository();
final products = productRepository.fetchProducts();