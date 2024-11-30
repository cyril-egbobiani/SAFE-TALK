import 'package:dio/dio.dart';
import 'package:safetalk/features/sign_up/model/signup_model.dart';
import 'package:safetalk/helpers/constants/app_constants.dart';
import 'package:safetalk/helpers/functions/dio_client.dart';
import 'package:safetalk/helpers/functions/endpoint.dart';

class SignupService {
  final DioClient dioClient;

  SignupService({required this.dioClient});

  Future<Response> addUser({required SignupModel signupModelData}) async {
    try {
      final Response response = await dioClient.makeRequest(
        Endpoints.addUser,
        RequestMethod.post,
        data: signupModelData.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
