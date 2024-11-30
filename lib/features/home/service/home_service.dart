import 'package:dio/dio.dart';
import 'package:safetalk/features/home/model/home_model.dart';
 import 'package:safetalk/helpers/constants/app_constants.dart';
import 'package:safetalk/helpers/functions/dio_client.dart';
import 'package:safetalk/helpers/functions/endpoint.dart';

class HomeService {
  final DioClient dioClient;

  HomeService({required this.dioClient});

  Future<Response> createPost({required HomeModel homeModelData}) async {
    try {
      final Response response = await dioClient.makeRequest(
        Endpoints.createPost,
        RequestMethod.post,
        data: homeModelData.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
