import 'package:dio/dio.dart';
import 'package:furniture_app/core/networking/api_endpoints.dart';
import 'package:furniture_app/features/home/model/home_model/categories_model.dart';
import 'package:furniture_app/features/home/model/home_model/product_model.dart';

class HomeData {
  final Dio dio;

  HomeData(this.dio);

  Future<List<ProductModel>> getProducts() async {
    try {
      var response = await dio.get(ApiEndpoints.getProducts);
      if (response.statusCode == 200) {
        final List<dynamic> productsJson = response.data["products"];
        final List<ProductModel> products =
            productsJson.map((json) => ProductModel.fromJson(json)).toList();
        return products;
      } else {
        throw Exception("Failed to retrieve products");
      }
    } on DioException catch (e) {
      throw Exception("Dio error: ${e.message}");
    } catch (e) {
      throw Exception("Unknown error: $e");
    }
  }


  Future<CategoriesModel> getCategories() async {
    try {
      final response = await dio.get(ApiEndpoints.getCategories);

      if (response.statusCode == 200) {
        final data = CategoriesModel.fromJson(response.data);
        return data;
      } else {
        throw Exception("Failed to load categories");
      }
    } on DioException catch (e) {
      throw Exception("Dio error: ${e.message}");
    } catch (e) {
      throw Exception("Unknown error: $e");
    }
  }

}
