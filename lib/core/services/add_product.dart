import 'package:store_app/core/remote/api_consumer.dart';
import 'package:store_app/core/remote/end_points.dart';
import 'package:store_app/core/models/product_model.dart';

class AddProduct {
  Future<ProductModel> addProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
  }) async {
    dynamic data = Api().post(
      url: EndPoints.baseUrl + ApiKeys.products,
      body: {
        'title': title,
        'price': price,
        'description': desc,
        'image': image,
        'category': category
      },
    );
    return ProductModel.fromJson(data);
  }
}
