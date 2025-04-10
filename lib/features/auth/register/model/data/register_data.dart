import 'package:dio/dio.dart';
import '../register_model/register_model.dart';

class RegisterData {
  final Dio dio = Dio();

  Future<RegisterResponse> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String address,
  }) async {
    try {
      final response = await dio.post(
        "https://zbooma.com/furniture_api/auth/register.php",
        data: {
          "name": name,
          "email": email,
          "password": password,
          "address": address,
          "phone": phone,
        },
      );

      if (response.statusCode == 200) {
        return RegisterResponse.fromJson(response.data);
      } else {
        return RegisterResponse(
            status: "error", message: "استجابة غير متوقعة من الخادم.");
      }
    } on DioException catch (error) {
      final res = error.response;
      if (res != null) {
        if (res.statusCode == 409) {
          return RegisterResponse.fromJson(res.data);
        }
        if (res.statusCode == 500) {
          return RegisterResponse(
              status: "error",
              message: "الرجاء تغيير الاسم.");
        }
        return RegisterResponse.fromJson(res.data);
      } else {
        return RegisterResponse(
            status: "error",
            message: error.message ?? "خطأ غير متوقع. تحقق من اتصال الإنترنت.");
      }
    }
  }
}
