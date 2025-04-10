import 'package:coffeeshop/data/DTO/product_dto.dart';
import 'package:coffeeshop/data/models/product_model.dart';


extension ProductMapper on ProductDTO {
  ProductModel toModel() 
   {
    return ProductModel(
      id: id,
      name: name,
      price: price,
      image: image,
      categoryId: categoryId
    );
  }
}
