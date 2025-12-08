import 'package:dio/dio.dart';
import 'package:untitled1/features/home/data/product_model.dart';

class HomeService{
  final Dio dio = Dio();
  Future<List<ProductModel>>
 getProducts() async {
    try{
      Response response = await dio.get("https://fakestoreapi.com/products");
      List data = response.data;
       return data.map((json) => ProductModel.fromJson(json)).toList();

    }
    catch (e) {
      throw Exception("Failed to load products : $e");
    }
  }

}