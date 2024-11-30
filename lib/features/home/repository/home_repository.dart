import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safetalk/features/home/model/home_model.dart';
import 'package:safetalk/features/home/service/home_service.dart';
 import 'package:safetalk/helpers/functions/navigation.dart';

 
class HomeRepository {
  final HomeService homeService;

  HomeRepository(this.homeService);

  Future<HomeModel> createPost({required HomeModel homeUserData}) async {
    try {
      final response =
          await homeService.createPost(homeModelData: homeUserData);
      if (response.statusCode == 200) {
        debugPrint('USER ADDED SUCCESSFULLY');
        Get.snackbar("Success", "User successfully logged in!",
            backgroundColor: Colors.green, colorText: Colors.white);
        push(
          page: '/BottomNavBar',
        );
        var user = HomeModel.fromJson(response.data as Map<String, dynamic>);
        return user;
      } else {
        return HomeModel.fromJson({});
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      rethrow;
    }
  }
}
