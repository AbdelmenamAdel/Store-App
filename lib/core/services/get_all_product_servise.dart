import 'dart:convert';

import 'package:store_app/core/models/product_model.dart';
import 'package:store_app/core/remote/api_consumer.dart';
import 'package:store_app/core/remote/end_points.dart';
import 'package:http/http.dart' as http;

class AllProductServises {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: EndPoints.baseUrl + ApiKeys.products);
    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
  }
}
