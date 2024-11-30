import 'package:dio/dio.dart';
import 'package:safetalk/features/login/model/login_model.dart';
import 'package:safetalk/helpers/constants/app_constants.dart';
import 'package:safetalk/helpers/functions/dio_client.dart';
import 'package:safetalk/helpers/functions/endpoint.dart';

class LoginService {
    final DioClient dioClient;

  LoginService({required this.dioClient});

  Future<Response> addUser({required LoginModel signupModelData}) async {
    try {
      final Response response = await dioClient.makeRequest(
        Endpoints.login,
        RequestMethod.post,
        data: signupModelData.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

}
