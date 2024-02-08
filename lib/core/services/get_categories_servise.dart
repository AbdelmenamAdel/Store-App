import 'package:store_app/core/remote/api_consumer.dart';
import 'package:store_app/core/remote/end_points.dart';
import 'package:store_app/core/models/product_model.dart';

class CategoriesServises {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String categoryName}) async {
    List<dynamic> data = await Api().get(
        url: EndPoints.baseUrl +
            ApiKeys.products +
            ApiKeys.category +
            categoryName);
    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(
        data[i],
      );
    }
    return productList;
  }
}
