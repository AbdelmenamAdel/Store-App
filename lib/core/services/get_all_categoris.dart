import 'package:store_app/core/remote/api_consumer.dart';
import 'package:store_app/core/remote/end_points.dart';

class AllCategoriesServises {
  Future<List<dynamic>> getCategoriesServise() async {
    List<dynamic> data = await Api()
        .get(url: EndPoints.baseUrl + ApiKeys.products + ApiKeys.category);
    return data;
  }
}
