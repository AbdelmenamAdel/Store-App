import 'package:store_app/core/models/product_model.dart';
import 'package:store_app/core/remote/api_consumer.dart';
import 'package:store_app/core/remote/end_points.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required int id,
      required String category}) async {
    print('product id  = $id');
    Map<String, dynamic> data = await Api()
        .put(url: '${EndPoints.baseUrl + ApiKeys.products}$id', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category,
    });

    return ProductModel.fromJson(data);
  }
}
