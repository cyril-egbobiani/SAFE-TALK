import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safetalk/features/login/model/login_model.dart';
import 'package:safetalk/features/login/service/login_service.dart';
import 'package:safetalk/helpers/functions/navigation.dart';

 
class LoginRepository {
  final LoginService loginService;

  LoginRepository(this.loginService);

  Future<LoginModel> addUser({required LoginModel addUserData}) async {
    try {
      final response =
          await loginService.addUser(signupModelData: addUserData);
      if (response.statusCode == 200) {
        debugPrint('USER ADDED SUCCESSFULLY');
        Get.snackbar("Success", "User successfully logged in!",
            backgroundColor: Colors.green, colorText: Colors.white);
        push(
          page: '/BottomNavBar',
        );
        var user = LoginModel.fromJson(response.data as Map<String, dynamic>);
        return user;
      } else {
        return LoginModel.fromJson({});
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      rethrow;
    }
  }
}
