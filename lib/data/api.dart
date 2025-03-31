import 'package:coffeeshop/data/items.dart';
import 'package:dio/dio.dart';


Map localCategories = {};
List localProducts = [];
final Map<int, List<CoffeeItem>> localCategorizedItems = {};

void main() {
  getData();
}

Future<void> getData() async {
  final dio = Dio();
  try {
    final response = await dio.get('http://coffeeshop.academy.effective.band/api/v1/products/categories');
    
    final List<dynamic> data = response.data['data'];
    localCategories = {
      for (var item in data) item['id']: item['slug'],
    };
    print(localCategories);

    
    final responseProducts = await dio.get('http://coffeeshop.academy.effective.band/api/v1/products');
    final List<dynamic> dataProducts = responseProducts.data['data'];
    for (var items in dataProducts) {
      localProducts.add([
        items['category']['id'],
        items['id'],
        items['name'],
        items['prices'][0]['value'],
        items['imageUrl']
      ]
      );
    }
    
      for (var product in localProducts) {
        final categoryId = product[0];
        final productData = CoffeeItem(categoryId: categoryId, id: product[1], name: product[2], price: product[3], image: product[4]);

        if (!localCategorizedItems.containsKey(categoryId)) {
          localCategorizedItems[categoryId] = [];
        }

        localCategorizedItems[categoryId]!.add(productData);
      }
    
  } catch (e) {
    print(e);
  }
}
