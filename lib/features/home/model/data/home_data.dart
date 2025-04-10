import 'package:dio/dio.dart';
import 'package:furniture_app/features/home/model/home_model/categories_model.dart';
import '../home_model/product_model.dart';

class HomeData {
  final dio = Dio();

  Future<List<ProductModel>> getProduct() async {
    var response = await dio.get("https://fakestoreapi.com/products");
    if (response.statusCode == 200) {
      List jsonBody = response.data;
      List<ProductModel> data = jsonBody
          .map(
            (e) => ProductModel.fromJson(e),
          )
          .toList();
      return data;
    } else {
      throw Exception("failure");
    }
  }

  Future<CategoriesModel> getCategories() async {
    try {
      final response = await dio.get(
          "https://zbooma.com/furniture_api/categories/get_categories.php");

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
