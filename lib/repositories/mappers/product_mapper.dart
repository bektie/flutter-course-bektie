import 'package:coffeeshop/data/product_dto.dart';
import 'package:coffeeshop/data/product_model.dart';


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
