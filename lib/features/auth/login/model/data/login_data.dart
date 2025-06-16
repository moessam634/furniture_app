import 'package:dio/dio.dart';
import '../../../../../core/networking/api_endpoints.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/storage_helper.dart';
import '../login_model/login_model.dart';

class LoginData {
  final Dio dio;

  LoginData(this.dio);

  Future<LoginModel> login(
      {required String name, required String password}) async {
    try {
      final response = await dio.post(
        ApiEndpoints.login,
        data: {
          "name": name,
          "password": password,
        },
      );
      final loginModel = LoginModel.fromJson(response.data);
      if (loginModel.token != null) {
        await sl<StorageHelper>().saveToken(loginModel.token!);
      }
      if (loginModel.user?.id != null) {
        await sl<StorageHelper>().saveUserId(loginModel.user!.id.toString());
      }

      return loginModel;
    } on DioException catch (error) {
      final message = error.response!.data["message"] ?? "Login failed";
      throw (message);
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
