import 'package:coffeeshop/src/features/menu/models/DTO/product_dto.dart';
import 'package:coffeeshop/src/features/menu/models/models/product_model.dart';

extension ProductMapper on ProductDTO {
  ProductModel toModel() {
    return ProductModel(
      id: id,
      name: name,
      price: price,
      image: image,
      categoryId: categoryId,
    );
  }
}
