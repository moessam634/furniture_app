import 'package:dio/dio.dart';
import 'package:furniture_app/core/networking/api_endpoints.dart';
import 'package:furniture_app/features/cart/model/model/cart_model.dart';
import 'package:furniture_app/features/cart/model/model/cart_products_model.dart';

import '../../../../core/utils/service_locator.dart';
import '../../../../core/utils/storage_helper.dart';

class CartData {
  final Dio dio;

  CartData(this.dio);

  Future<List<CartProductsModel>> getCartProducts() async {
    final userId = await sl<StorageHelper>().getUserId();
    try {
      final response = await dio
          .get(ApiEndpoints.cart, queryParameters: {"user_id": userId});
      List data = response.data["cart"];
      return data.map((e) => CartProductsModel.fromJson(e)).toList();
    } on DioException catch (error) {
      if (error.response != null) {
        throw Exception(
            error.response!.data["message"] ?? "Failed to fetch cart");
      } else {
        throw Exception("Unexpected Dio error: $error");
      }
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<CartModel> addToCart({required int productId, int? quantity}) async {
    final userId = await sl<StorageHelper>().getUserId();
    try {
      final response = await dio.post(
        ApiEndpoints.cart,
        data: {
          "user_id": userId,
          'product_id': productId,
          "quantity": quantity,
        },
      );
      if (response.statusCode == 200) {
        return CartModel.fromJson(response.data);
      } else {
        throw Exception('Something went wrong');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        return CartModel.fromJson(error.response!.data);
      } else {
        throw Exception('Unexpected Dio error: $error');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

   updateCartQuantity({required int cartId, required int quantity}) async {
    final userId = await sl<StorageHelper>().getUserId();
    try {
      await dio.put(
        ApiEndpoints.cart,
        queryParameters: {"user_id": userId},
        data: {"cart_id": cartId, "quantity": quantity},
      );
    } on DioException catch (error) {
      if (error.response != null) {
        throw Exception(error.response!.data["message"]);
      } else {
        throw Exception('Unexpected Dio error: $error');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<CartModel> deleteFromCart({required int cartId}) async {
    final userId = await sl<StorageHelper>().getUserId();
    try {
      final response = await dio.delete(
        ApiEndpoints.cart,
        queryParameters: {"user_id": userId},
        data: {"cart_id": cartId},
      );
      if (response.statusCode == 200) {
        return CartModel.fromJson(response.data);
      } else {
        throw Exception('Something went wrong');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        return CartModel.fromJson(error.response!.data);
      } else {
        throw Exception('Unexpected Dio error: $error');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
