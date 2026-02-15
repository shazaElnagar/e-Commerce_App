import 'package:dio/dio.dart';
import 'package:untitled1/features/home/data/product_model.dart';

class HomeService{
  final Dio dio = Dio();
  Future<List<ProductModel>> getProducts() async {
    try {
      print("START REQUEST");

      Response response =
      await dio.get("https://dummyjson.com/products");

      print("RESPONSE RECEIVED");

      List data = response.data["products"]; // 👈 هنا الفرق المهم

      return data
          .map((json) => ProductModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception("Failed to load products : $e");
    }
  }

}